import { Hono } from 'hono';
import toolkitController from '../../controllers/toolkitController';
interface Routes {
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


for (const key in routes.get) {
  router.get(key, routes.get[key]);
}


export default router
