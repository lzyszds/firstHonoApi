//src/middleware/auth.ts
import { Context, Next } from 'hono'
import CONFIG from '../../config';
import userModel from '@/models/user';
export async function authMiddleware(c: Context, next: Next) {
  const api = c.req.path.split('/')
  const url = `/${api[2]}/${api[3]}`

  // 白名单
  if (CONFIG.interceptorWhiteList.includes(url)) {
    return await next()
  }


  const token = c.req.header('Authorization')
  if (!token || token == 'undefined') {
    return c.json({ error: '未经许可(或批准)的', code: 401 }, 401)
  }

  // 验证token逻辑...
  const userInfo = await userModel.getUserInfoToken(token!)

  if (!userInfo[0].uid) {
    return c.json({ error: '未经许可(或批准)的', code: 401 }, 401)
  }
  if (userInfo[0].whether_use != 1) {
    return c.json({ error: '该账号已被禁用', code: 401 }, 401)
  }

  await next()
}
