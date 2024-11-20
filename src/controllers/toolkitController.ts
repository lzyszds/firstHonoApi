import { Context } from "hono";
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

  //诗词内容获取代理接口
  async getPoetry(c: Context) {
    return c.json(await ToolkitService.getPoetry(c));
  }

}

export default new ToolkitController();
