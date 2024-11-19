import SystemService from "../services/systemService";
import { Context } from "hono";

class SystemController {

  //获取系统配置
  async getSystemConfig(c: Context) {
    return c.json(await SystemService.getSystemConfig(c));
  }

  //新增系统配置
  async addSystemConfig(c: Context) {
    return c.json(await SystemService.addSystemConfig(c));
  }

  //更新系统配置
  async updateSystemConfig(c: Context) {
    return c.json(await SystemService.updateSystemConfig(c));
  }

  //系统公告
  async getNotification(c: Context) {
    return c.json(await SystemService.getNotification());
  }

  async addFooterInfo(c: Context) {
    return c.json(await SystemService.addFooterInfo(c));
  }

  //获取页脚信息数据
  async getFooterInfo(c: Context) {
    return c.json(await SystemService.getFooterInfo());
  }

  //更新页脚信息
  async updateFooterInfo(c: Context) {
    return c.json(await SystemService.updateFooterInfo(c));
  }

  //获取系统加载图片列表
  async getSystemLoadImages(c: Context) {
    return c.json(await SystemService.getSystemLoadImages());
  }

  //获取当前系统选择的加载图片 图片懒加载的loadGif图片
  async getLazyLoadImage(c: Context) {
    const imgBuffer = await SystemService.getLazyLoadImage(c);
    c.set('Content-Type', 'image/jpeg');
    return c.body(imgBuffer);
  }

  //将图片上传至腾讯图库
  async uploadImageToTencent(c: Context) {

    return c.json(await SystemService.uploadImageToTencent(c));
  }

}

export default new SystemController();
