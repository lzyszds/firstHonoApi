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
import { broadcastOnlineUsers, connections, handleWebSocketUpgrade, onlineUsers } from './tools/webScoket';
import userService from './services/userService';


// 扩展 Context 类型
declare module 'hono' {
  interface Context {
    redis: typeof redis;
  }
}

const app = new Hono()
let bunServer

//静态资源映射
app.use('/static/*', serveStatic({ root: './' }))

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
  return c.json({ ip: c.env.requestIP(c.req.raw) })
})
// WebSocket Upgrade Handler
app.get('/api/websocket', (c) => {
  if (c.req.header('Upgrade') !== 'websocket') {
    return c.text('Not a WebSocket request', 400);
  }

  const server = c.server; // Get the Bun server instance
  const success = server.upgrade(c.req.raw, {
    data: {
      userId: null, // Initially, userId is not known
    },
    // You might want to pass through headers like Sec-WebSocket-Protocol here
  });

  if (success) {
    // Return undefined to let Bun handle the WebSocket connection
    return undefined;
  }

  return new Response('Failed to upgrade to WebSocket', { status: 500 });
});


// Initialize tasks
taskManager.initTasks();

// Server Configuration
export default {
  port: Number(process.env.PORT) || 2024,
  fetch: (req: Request, server: Server) => { // Access the server object here
    const url = new URL(req.url);

    // WebSocket Upgrade Handling (directly within fetch)
    if (url.pathname === '/api/websocket') {
      if (req.headers.get('Upgrade') !== 'websocket') {
        return new Response('Not a WebSocket request', { status: 400 });
      }

      const success = server.upgrade(req, {
        data: {
          userId: null,
        } as WebSocketData,
      });

      if (success) {
        return undefined; // Let Bun handle the WebSocket connection
      }

      return new Response('Failed to upgrade to WebSocket', { status: 500 });
    }

    // Handle non-WebSocket requests using Hono
    return app.fetch(req, server); 
  },
  websocket: {
    open: (ws: any) => { // Type as any if a specific WebSocket type is not available
      console.log('WebSocket opened');
      // Check for ws.data and ws.data.userId if needed
      if (ws.data && ws.data.userId) {
          console.log(`User ${ws.data.userId} connected (on open)`);
      }
    },
    message: async (ws: any, message: string | Uint8Array) => {
      try {
        const decodedMessage = typeof message === 'string' ? message : new TextDecoder().decode(message);
        const data = JSON.parse(decodedMessage);

        if (data.type === 'login' && data.userId && data.token) {
          // ... Verify token (using your preferred method) ...
          const user = await userService.getUserInfoToken(data.token);
          if (data.userId != user[0].id) {
            return ws.close(1008, 'token 错误');
          }

          // Set userId on ws.data after successful verification
          ws.data.userId = data.userId;

          onlineUsers.add(data.userId);
          connections.set(data.userId, ws);
          console.log(`User ${data.userId} connected (on message)`);
          broadcastOnlineUsers();
        } else {
          // Handle other message types...
          // You may need to check ws.data.userId here as well,
          // depending on your application logic.
          console.log('Received unknown message:', data);
          
        }
      } catch (error) {
        console.error('Error handling WebSocket message:', error);
        ws.send(JSON.stringify({ type: 'error', message: 'Invalid message format' }));
      }
    },
    close: (ws: any) => {
      console.log('WebSocket closed');
      // Check for ws.data and ws.data.userId if needed
      if (ws.data && ws.data.userId) {
        onlineUsers.delete(ws.data.userId);
        connections.delete(ws.data.userId);
        console.log(`User ${ws.data.userId} disconnected`);
        broadcastOnlineUsers();
      }
    },
  },
};
