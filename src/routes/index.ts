import {Hono} from 'hono';
import userRouter from './api/user';
import toolkitRouter from './api/toolkit';
import articleRouter from './api/article';
import commentRouter from './api/comment';
import systemRouter from './api/system';
import openAIRouter from './api/openAI';
import plantaskRouter from './api/plantask';
import websocketRouter from './api/websocket';
import permissionRouter from './api/permission'

const app = new Hono();

interface Routes {
  [key: string]: Hono;
}

const routes: Routes = {
  '/user': userRouter, // 用户路由
  '/toolkit': toolkitRouter, // 工具路由
  '/article': articleRouter, // 文章路由
  '/comment': commentRouter, // 评论路由
  '/system': systemRouter, // 系统路由
  '/openAI': openAIRouter, // OpenAI路由
  '/plantask': plantaskRouter, // 计划任务路由
  '/websocket': websocketRouter, // websocket路由
  '/permission': permissionRouter, // 权限路由
}

// 注册子路由
for (const key in routes) {
  app.route(key, routes[key]);
}


export default app;
