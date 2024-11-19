import {Hono} from 'hono';
import systemController from '../../controllers/systemController';

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    // 获取系统配置
    '/getSystemConfig': systemController.getSystemConfig,
    // 系统公告
    '/getNotification': systemController.getNotification,
    // 获取页脚信息数据
    '/getFooterInfo': systemController.getFooterInfo,
    // 获取系统加载图片列表
    '/getSystemLoadImages': systemController.getSystemLoadImages,
    // 获取当前系统选择的加载图片 图片懒加载的loadGif图片
    '/getLazyLoadImage': systemController.getLazyLoadImage,

  },
  post: {
    // 新增系统配置
    '/addSystemConfig': systemController.addSystemConfig,
    // 更新系统配置
    '/updateSystemConfig': systemController.updateSystemConfig,
    // 新增页脚信息
    '/addFooterInfo': systemController.addFooterInfo,
    // 更新页脚信息
    '/updateFooterInfo': systemController.updateFooterInfo,
    // 将图片上传至腾讯图库
    '/uploadImageToTencent': systemController.uploadImageToTencent
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
