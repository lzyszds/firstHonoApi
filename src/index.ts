import { Hono } from 'hono'
import { serveStatic } from 'hono/bun'
import { authMiddleware } from './middleware/auth'
import { camelCaseMiddleware } from './middleware/camelcase'
import { corsAllMiddleware } from './middleware/cors';
import logger from './middleware/logger';
import db from './utils/db'
import routes from './routes';
// import setTimeTask from './tools/setTimeTask';
import redis from './utils/redis'; // 导入 Redis 客户端
import { addTraceId } from './middleware/trace_time';
import { moreLogger } from './middleware/moreLogger';
import fs from "fs";
import path from "path";
import { taskManager } from "@/utils/taskManager";
import { handleWebSocketUpgrade, websocket } from './tools/webScoket';
import Config from "../config";
import { getIpAddress } from './utils/getIpAddress';
import websocketRouter from './routes/api/websocket';
import { initializeConfig } from './config';
import { initPermissionConfig } from './config/permission';
import { scanApiFiles } from './tools/autoCreateInterface'
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';
import timezone from 'dayjs/plugin/timezone';

// 扩展 Context 类型
declare module 'hono' {
    interface Context {
        redis: typeof redis;
    }
}

const app = new Hono()

//静态资源映射
app.use('/static/*', serveStatic({ root: './' }))

// 添加 Redis 客户端到上下文
app.use('/api/*', (c, next) => {
    c.redis = redis;
    return next()
});

// 导入中间件
app.use('/api/*', corsAllMiddleware)// 配置CORS中间件
app.use('/api/*', authMiddleware) // 认证中间件
app.use('/api/*', camelCaseMiddleware) //  驼峰命名中间件


app.use('/api/*', addTraceId) // 添加 trace_id 和计时
app.use('/api/*', moreLogger) // 更多日志 更全的日志


// 注册子路由
app.route('/api', routes)
app.get('/api/ip', async (c) => {
    return c.text(await getIpAddress(c))
});

// 注册websocket路由
app.route('/websocket', websocketRouter)


// 检查数据库连接
db.query('SELECT 1', [])
    .then(async () => {
        console.log('数据库连接成功')
        await initializeConfig()
        await initPermissionConfig()
        // 生成接口表
        // scanApiFiles()
    })
    .catch(err => console.error('数据库连接失败', err))



// 404页面
app.notFound((c) => {
    const htmlPath = path.join(__dirname, '../static', 'html/404.html')
    console.log(htmlPath)
    const htmlContent = fs.readFileSync(htmlPath, 'utf-8')
    return c.html(htmlContent)
})

// 错误处理
app.onError((err, c) => {
    logger.error(err)
    return c.text('出错了看看怎么解决吧！', 500)
})

// Initialize tasks
taskManager.initTasks();



dayjs.extend(utc);
dayjs.extend(timezone);

// 设置默认时区
dayjs.tz.setDefault('Asia/Shanghai');


// Server Configuration
export default {
    port: Number(Config.port) || 2024,
    fetch: (req: Request, server: any) => { // Access the server object here,
        const url = new URL(req.url);
        // WebSocket Upgrade Handling (directly within fetch)
        if (url.pathname == "/websocket/onlineUsers") {
            handleWebSocketUpgrade(req, server);
        }
        // Handle non-WebSocket requests using Hono
        return app.fetch(req, server);
    },
    websocket: websocket
};
