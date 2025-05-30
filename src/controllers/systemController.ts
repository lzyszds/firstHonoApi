import SystemService from "../services/systemService";
import {Context} from "hono";

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
    return c.json(await SystemService.getNotification(c));
  }

  //新增页脚信息
  async addFooterInfo(c: Context) {
    return c.json(await SystemService.addFooterInfo(c));
  }

  //新增二级页脚信息
  async addFooterLink(c: Context) {
    return c.json(await SystemService.addFooterLink(c));
  }

  //获取页脚信息数据
  async getFooterInfo(c: Context) {
    return c.json(await SystemService.getFooterInfo(c));
  }

  //更新页脚一级分类信息
  async updateFooterCategory(c: Context) {
    return c.json(await SystemService.updateFooterCategory(c));
  }

  //更新页脚二级分类信息
  async updateFooterLink(c: Context) {
    return c.json(await SystemService.updateFooterLink(c));
  }

  //更新页脚信息
  async updateFooterInfo(c: Context) {
    return c.json(await SystemService.updateFooterInfo(c));
  }

  //获取系统加载图片列表
  async getSystemLoadImages(c: Context) {
    return c.json(await SystemService.getSystemLoadImages(c));
  }

  //获取当前系统选择的加载图片 图片懒加载的loadGif图片
  async getLazyLoadImage(c: Context) {
    const imgBuffer = await SystemService.getLazyLoadImage(c);
    c.set('Content-Type', 'image/jpeg');
    return c.body(imgBuffer);
  }
  //获取系统日志
    async getSystemLog(c: Context) {
        return c.json(await SystemService.getSystemLog(c));
    }


}

export default new SystemController();
