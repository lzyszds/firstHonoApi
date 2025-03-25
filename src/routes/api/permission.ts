import { Hono } from "hono";
import permissionController from "../../controllers/permissionController";

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    // 获取所有接口列表
    "/getAll": permissionController.findAll,

    // 获取接口所属信息
    "/getBelongs": permissionController.findBelongs,
    
  },
  post: {
    // 修改接口权限
    "/update": permissionController.update,
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
