import {Hono} from "hono";
import toolkitController from "../../controllers/toolkitController";

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    // 天气预报以及ip地址查询
    "/getWeather": toolkitController.getWeather,
    // 后台首页数据
    "/getAdminHomeData": toolkitController.getAdminHomeData,
    // 获取github 贡献图
    "/getGithubInfo": toolkitController.getGithubInfo,
    // 获取github前端项目的提交记录
    "/getGithubFrontCommit": toolkitController.getGithubFrontCommit,
    // 诗词内容获取代理接口
    "/getPoetry": toolkitController.getPoetry,
    // 获取已存进图库中的图片
    "/getPictureBedImageList": toolkitController.getPictureBedImageList,
  },
  post: {
    // 将图片上传至图库
    "/uploadImageToPictureBed": toolkitController.uploadImageToPictureBed,
    // 删除图库中的图片以及数据库存储中的记录
    "/deletePictureBedImage": toolkitController.deletePictureBedImage,
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
