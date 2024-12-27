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
    // 获取系统日志
    '/getSystemLog': systemController.getSystemLog,

  },
  post: {
    // 新增系统配置
    '/addSystemConfig': systemController.addSystemConfig,
    // 更新系统配置
    '/updateSystemConfig': systemController.updateSystemConfig,
    // 新增页脚信息
    '/addFooterInfo': systemController.addFooterInfo,
    //新增二级页脚信息
    '/addFooterLink': systemController.addFooterLink,
    // 更新页脚一级分类信息
    '/updateFooterCategory': systemController.updateFooterCategory,
    // 更新页脚二级分类信息
    '/updateFooterLink': systemController.updateFooterLink,
    // 更新页脚信息
    '/updateFooterInfo': systemController.updateFooterInfo,
   
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
