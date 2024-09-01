//src/middleware/auth.ts
import { Context, Next } from 'hono'

export async function authMiddleware(c: Context, next: Next) {
  // const token = c.req.header('Authorization')
  // if (!token) {
  //   return c.json({ error: '未经许可(或批准)的' }, 401)
  // }
  // 验证token逻辑...
  await next()
}
