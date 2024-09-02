import { Hono } from 'hono'
import { serveStatic } from 'hono/bun'
import { authMiddleware } from './middleware/auth'
import logger from './middleware/logger';
import db from './utils/db'
import routes from './routes';

const app = new Hono()

//静态资源映射
app.use('/static/*', serveStatic({ root: './' }))

//导入中间件
app.use('/api/*', authMiddleware) // 认证中间件

// 注册子路由
app.route('/api', routes)

// 检查数据库连接
db.query('SELECT 1', [])
  .then(() => console.log('数据库连接成功'))
  .catch(err => console.error('数据库连接失败', err))


// 请求日志中间件
// app.use('*', async (c, next) => {
//   logger.info(`Received ${c.req.method} request to ${c.req.url}`)
//   await next()
//   logger.info(`Responded with status ${c.res.status}`)
// })




// // 首页
// app.get('/', (c) => c.text('Hello Hono!'))

// 404页面
app.notFound((c) => {
  logger.warn(`404 Not Found: ${c.req.url}`)
  return c.text('找不到你想要的网页', 404)
})

// 错误处理
app.onError((err, c) => {
  logger.error(err.message)
  return c.text('出错了看看怎么解决吧！', 500)
})

export default {
  port: 2024,
  fetch: app.fetch,
} 
