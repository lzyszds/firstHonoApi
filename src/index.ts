import {Hono} from 'hono'
import {serveStatic} from 'hono/bun'
import {authMiddleware} from './middleware/auth'
import {camelCaseMiddleware} from './middleware/camelcase'
import {corsAllMiddleware} from './middleware/cors';
import logger from './middleware/logger';
import db from './utils/db'
import routes from './routes';
// import setTimeTask from './tools/setTimeTask';
import redis from './utils/redis'; // 导入 Redis 客户端
import {addTraceId} from './middleware/trace_time';
import {moreLogger} from './middleware/moreLogger';
import fs from "fs";
import path from "path";
import {taskManager} from "@/utils/taskManager";


// 扩展 Context 类型
declare module 'hono' {
  interface Context {
    redis: typeof redis;
  }
}

const app = new Hono()
let bunServer

//静态资源映射
app.use('/static/*', serveStatic({root: './'}))

// 导入中间件


app.use('/api/*', corsAllMiddleware)// 配置CORS中间件
app.use('/api/*', authMiddleware) // 认证中间件
app.use('/api/*', camelCaseMiddleware) //  驼峰命名中间件 
// 添加 Redis 客户端到上下文
app.use('/api/*', (c, next) => {
  c.redis = redis;
  return next()
});

app.use('/api/*', addTraceId) // 添加 trace_id 和计时
app.use('/api/*', moreLogger) // 更多日志 更全的日志


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
  const htmlPath = path.join(__dirname, '../static', 'html/404.html')
  console.log(htmlPath)
  const htmlContent = fs.readFileSync(htmlPath, 'utf-8')
  return c.html(htmlContent)
})

// 错误处理
app.onError((err, c) => {
  logger.error(err.message)
  return c.text('出错了看看怎么解决吧！', 500)
})


app.get('/api/ip', (c) => {
  // @ts-ignore
  return c.json({ip: c.env.requestIP(c.req.raw)})
})

// 初始化执行计划任务
taskManager.initTasks()
export default {
  port: 2024,
  fetch: app.fetch,
} 
