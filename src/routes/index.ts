import { Hono } from 'hono';
import { usersRouter } from './api/users';

const app = new Hono();

// 注册子路由
app.route('/users', usersRouter);

export default app;
