import {Hono} from "hono";
import plantaskController from "../../controllers/plantaskController";

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    // 获取所有任务
    "/tasks": plantaskController.getAllTask,
    // 获取可添加的任务参数
    "/getTaskParams": plantaskController.getTaskParams,
    // 根据任务id获取任务日志
    "/tasks/:taskId/logs": plantaskController.getTaskLog
  },
  post: {
    // 创建定时计划任务
    "/createTask": plantaskController.createTask,
    // 更新定时计划任务
    "/updateTask": plantaskController.updateTask,
    // 立即执行任务
    "/tasks/:taskId/execute": plantaskController.executeTaskImmediately,
    // 禁用任务
    "/tasks/:taskId/disable": plantaskController.disableTask,
    // 启用任务
    "/tasks/:taskId/enable": plantaskController.enableTask,
    //删除任务
    "/tasks/:taskId/delete": plantaskController.deleteTask
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
