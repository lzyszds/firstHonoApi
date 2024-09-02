import { Context, Hono } from 'hono';
import usersRouter from './api/users';
import toolkitRouter from './api/tooltik';
import articleRouter from './api/article';
import commentRouter from './api/comment';
import systemRouter from './api/system';
import openAIRouter from './api/openAI';

const app = new Hono();

interface Routes {
  [key: string]: Hono;
}

const routes: Routes = {
  '/users': usersRouter,
  '/toolkit': toolkitRouter,
  '/article': articleRouter,
  '/comment': commentRouter,
  '/system': systemRouter,
  '/openAI': openAIRouter,
}

// 注册子路由
for (const key in routes) {
  app.route(key, routes[key]);
}

export default app;
