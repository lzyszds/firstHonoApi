import { Context, Next } from 'hono'
import { getCookie } from 'hono/cookie';
import { decodeToken } from "@/utils/authUtils";
import { User } from "@/domain/User";
import { getConfig } from '@/config/permission'
import { PermissionType } from '@/domain/PermissionType'

// 统一错误响应接口
interface ErrorResponse {
    error: string;
    code: number;
}

// 权限映射定义
type PermissionMap = {
    [key: number]: number[];
};

function isErrorResponse(obj: any): obj is ErrorResponse {
    return obj && typeof obj.error === 'string' && typeof obj.code === 'number';
}

// 创建错误响应的辅助函数
function createError(message: string, isAuthenticated: boolean): ErrorResponse {
    return {
        error: message,
        code: isAuthenticated ? 403 : 401 // 已认证但无权限用403，未认证用401
    };
}

// 验证token中间件
export async function authMiddleware(c: Context, next: Next) {
    const api = c.req.path.split('/')
    let url: string

    // 动态生成匹配模式，允许任意ID
    if (api.length > 4) {
        url = `/${api[2]}/${api[3]}/:id/${api[5]}`
    } else {
        url = `/${api[2]}/${api[3]}`
    }

    // 从缓存中获取权限列表
    const cachedPermission = await c.redis.get('permission');
    let permission: PermissionType[]; // 权限列表
    if (cachedPermission) {
        // 缓存中有权限列表
        permission = JSON.parse(cachedPermission);
    } else {
        // 缓存中没有权限列表，重新获取
        permission = await getConfig()
        await c.redis.setex('permission', 600, JSON.stringify(permission));
    }

    // 使用通配符匹配接口权限
    const accordPermission = permission.find((item: PermissionType) => {
        // 使用正则表达式替换 :id 或 :taskId
        const pattern = item.interface_name.replace(/:id|:taskId/g, '[^/]+')
        const regex = new RegExp(`^${pattern}$`)
        return regex.test(url)
    })

    if (!accordPermission) return next()

    const apiRoles = accordPermission.interface_permissions
    if (apiRoles === 0) {
        // 公开接口
        return await next()
    } else {
        // 需要权限的接口
        const userInfo = await verifyAccount(c)
        if (isErrorResponse(userInfo)) {
            return c.json(userInfo, userInfo.code);
        }

        const permissionMap: PermissionMap = {
            1: [0, 1],  // 普通用户和管理员
            2: [0],     // 仅管理员
            3: [2]      // 特殊权限
        }; 

        if (permissionMap[apiRoles]?.includes(userInfo.power!)) {
            return await next();
        }

        // 已登录但权限不足
        return c.json(createError('权限不足，无法访问该资源', true), 403);
    }
}

// 验证账号方法保持不变
async function verifyAccount(c: Context): Promise<User | ErrorResponse> {
    // 获取token
    const token = getCookie(c, 'lzytkn') || c.req.header('authorization')
    if (!token || token === 'undefined') {
        return createError('未登录，请先登录', false);
    }
    try {
        // 验证token逻辑...
        const userInfo = decodeToken(token) as User
        if (!userInfo.uid) {
            return createError('无效的用户信息', false);
        }
        if (userInfo.whether_use != 1) {
            return createError('该账号已被禁用', true);
        }
        return userInfo
    } catch (e) {
        return createError('令牌已过期，请重新登录', false);
    }
}