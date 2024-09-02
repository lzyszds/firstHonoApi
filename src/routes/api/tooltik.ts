import { Hono } from 'hono';
import toolkitController from '../../controllers/toolkitController';
interface Routes {
  [key: string]: { [key: string]: (c: any) => any };
  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}
const router = new Hono();

const routes: Routes = {
  get: {
    //天气预报以及ip地址查询
    '/getWeather': toolkitController.getWeather,
    //后台首页数据
    '/getAdminHomeData': toolkitController.getAdminHomeData,
    //获取github 贡献图
    '/getGithubInfo': toolkitController.getGithubInfo,
    //诗词内容获取代理接口
    '/getPoetry': toolkitController.getPoetry,
  },
  post: {}
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}



export default router
