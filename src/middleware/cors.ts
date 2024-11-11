import { cors } from 'hono/cors'
import CONFIG from '../../config';

// 跨域中间件配置
export const corsAllMiddleware = cors({
  ...CONFIG.cors,
  maxAge: 3600,
  credentials: true,
})
