import { Hono } from 'hono';
import plantaskController from '../../controllers/plantaskController';
interface Routes {
     [key: string]: { [key: string]: (c: any) => any };
     get: { [key: string]: (c: any) => any };
     post: { [key: string]: (c: any) => any };
}
const router = new Hono();

const routes: Routes = {
     get: {
          // 获取邮箱定时计划配置
          '/getEmailTaskConfig': plantaskController.getEmailTaskConfig,
          // 获取所有任务
          '/tasks': plantaskController.getAllTask,
          // 根据任务id获取任务日志
          '/tasks/:taskId/logs': plantaskController.getTaskLog
     },
     post: {
          // 更新邮箱定时计划配置
          '/updateEmailTaskConfig': plantaskController.updateEmailTaskConfig,
          // 创建定时计划任务
          '/createTask': plantaskController.createTask,
          // 禁用任务
          '/tasks/:taskId/disable': plantaskController.disableTask,
          // 启用任务
          '/tasks/:taskId/enable': plantaskController.enableTask,


     }
}


for (const method in routes) {
     for (const path in routes[method]) {
          //@ts-ignore
          router[method](path, routes[method][path]);
     }
}


export default router
