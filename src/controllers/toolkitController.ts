import {Context} from "hono";
import ToolkitService from "../services/toolkitService";

class ToolkitController {

  //天气预报以及ip地址查询
  async getWeather(c: Context) {
    return c.json(await ToolkitService.getWeather(c))
  }

  //后台首页数据
  async getAdminHomeData(c: Context) {
    return c.json(await ToolkitService.getAdminHomeData(c));
  }

  //获取github 贡献图
  async getGithubInfo(c: Context) {
    return c.json(await ToolkitService.getGithubInfo(c));
  }

  //获取github前端项目的提交记录
  async getGithubFrontCommit(c: Context) {
    return c.json(await ToolkitService.getGithubFrontCommit(c));
  }

  //诗词内容获取代理接口
  async getPoetry(c: Context) {
    return c.json(await ToolkitService.getPoetry(c));
  }

  //获取已存进图库中的图片
  async getPictureBedImageList(c: Context) {
    return c.json(await ToolkitService.getPictureBedImageList(c));
  }

  //将图片上传至腾讯图库
  async uploadImageToPictureBed(c: Context) {
    return c.json(await ToolkitService.uploadImageToPictureBed(c));
  }

  //删除图库中的图片以及数据库存储中的记录
  async deletePictureBedImage(c: Context) {
    return c.json(await ToolkitService.deletePictureBedImage(c));
  }

  // 清空redis中所有缓存
  async clearRedisCacheAll(c: Context) {
    return c.json(await ToolkitService.clearRedisCacheAll(c));
  }

}

export default new ToolkitController();
