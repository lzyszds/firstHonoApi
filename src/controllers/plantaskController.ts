//文章接口
import PlantaskService from "../services/plantaskService";
import {Context} from "hono";


class PlantaskController {


  //立即执行任务
  async executeTaskImmediately(c: Context) {
    return c.json(await PlantaskService.executeTaskImmediately(c));
  }

  //创建定时计划任务
  async createTask(c: Context) {
    return c.json(await PlantaskService.createTask(c));
  }

  //修改定时任务
  async updateTask(c: Context) {
    return c.json(await PlantaskService.updateTask(c));
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

  //获取可添加的任务参数
  async getTaskParams(c: Context) {
    return c.json(await PlantaskService.getTaskParams(c));
  }

  //根据任务id获取任务日志
  async getTaskLog(c: Context) {
    return c.json(await PlantaskService.getTaskLog(c));
  }


  //删除任务
  async deleteTask(c: Context) {
    return c.json(await PlantaskService.deleteTask(c));
  }
}

export default new PlantaskController();
