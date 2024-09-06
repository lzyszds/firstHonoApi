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

     },
     post: {
          // 更新邮箱定时计划配置
          '/updateEmailTaskConfig': plantaskController.updateEmailTaskConfig,
     }
}


for (const method in routes) {
     for (const path in routes[method]) {
          //@ts-ignore
          router[method](path, routes[method][path]);
     }
}


export default router
