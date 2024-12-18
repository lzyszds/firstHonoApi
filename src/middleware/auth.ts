//src/middleware/auth.ts
import {Context, Next} from 'hono'
import CONFIG from '../../config';
import {getCookie} from 'hono/cookie';
import {decodeToken} from "@/utils/authUtils";
import {User} from "@/domain/User";

export async function authMiddleware(c: Context, next: Next) {
  const api = c.req.path.split('/')
  const url = `/${api[2]}/${api[3]}`

  // 白名单
  if (CONFIG.interceptorWhiteList.includes(url)) {
    return await next()
  }
  const token = getCookie(c, 'lzytkn') || c.req.header('authorization')
  if (!token || token == 'undefined') {
    return c.json({error: '未经许可(或批准)的', code: 401}, 401)
  }

  try {
    // 验证token逻辑...
    const userInfo = decodeToken(token) as User

    // const userInfo = await userModel.getUserInfoToken(token!)
    if (!userInfo.uid) {
      return c.json({error: '未经许可(或批准)的', code: 401}, 401)
    }
    if (userInfo.whether_use != 1) {
      return c.json({error: '该账号已被禁用', code: 401}, 401)
    }
  } catch (e) {
    return c.json({error: '令牌已过期', code: 401}, 401)
  }


  await next()
}
