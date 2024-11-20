//文章接口
import PlantaskService from "../services/plantaskService";
import {Context} from "hono";


class PlantaskController {

  //获取邮箱定时计划配置
  async getEmailTaskConfig(c: Context) {
    return c.json(await PlantaskService.getEmailTaskConfig(c));
  }

  //更新邮箱定时计划配置
  async updateEmailTaskConfig(c: Context) {
    return c.json(await PlantaskService.updateEmailTaskConfig(c));
  }

  //创建定时计划任务
  async createTask(c: Context) {
    return c.json(await PlantaskService.createTask(c));
  }

  //禁用任务
  async disableTask(c: Context) {
    return c.json(await PlantaskService.disableTask(c));
  }

  //启用任务
  async enableTask(c: Context) {
    return c.json(await PlantaskService.enableTask(c));
  }

  //获取所有任务
  async getAllTask(c: Context) {
    return c.json(await PlantaskService.getAllTask(c));
  }

  //根据任务id获取任务日志
  async getTaskLog(c: Context) {
    return c.json(await PlantaskService.getTaskLog(c));
  }

}

export default new PlantaskController();
