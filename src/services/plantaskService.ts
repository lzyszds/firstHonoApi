import {Context} from "hono";
import fse from 'fs-extra';
import path from 'path'
import logger from "@/middleware/logger";
import ApiConfig from "@/domain/ApiCongfigType";
import {createTask, destroyTask} from '@/utils/taskScheduler';
import emailPost from '@/tools/emailPost';
import {taskManager} from "@/utils/taskManager";
import PlantaskMapper from '@/models/plantask'

class PlantaskService {
  //获取邮箱定时计划配置
  public async getEmailTaskConfig(c: Context) {
    const apiConfig = new ApiConfig(c)
    try {
      const emailJsonPath = path.join(__dirname, '../../static/config/email.json')
      return apiConfig.success(await fse.readJson(emailJsonPath))
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('获取失败')
    }
  }

  //更新邮箱定时计划配置
  public async updateEmailTaskConfig(c: Context) {
    // { "myEmail": "", "myName": "", "service": "", "auth_pass": "", "subject": "", "toEmail": "", "content": "", "planTime": "" }
    const apiConfig = new ApiConfig(c)
    const params = await c.req.json()
    if (!params.planTime) params.planTime = '0 55 22 * * *'
    try {
      const emailJsonPath = path.join(__dirname, '../../static/config/email.json')
      await fse.writeJson(emailJsonPath, params)
      //销毁之前的定时任务
      destroyTask("dailyEmail");
      //重新启动定时任务
      createTask("dailyEmail", params.planTime, emailPost.sendEmailWarn(""))

      return apiConfig.success(await fse.readJson(emailJsonPath))
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('更新失败')
    }
  }

  //创建定时计划任务
  public async createTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    const {name, type, cron_expression} = await c.req.json()

    try {
      const taskId = await taskManager.createTask({
        name,
        type,
        cron_expression,
        is_enabled: 0 //默认不启用
      })
      return apiConfig.success(taskId)
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('创建失败')
    }
  }

  // 修改定时任务
  public async updateTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    const params = await c.req.json()
    try {
      const result = await PlantaskMapper.updatePlantask(params)
      if (result.affectedRows === 0) return apiConfig.fail('修改失败')
      const task = (await PlantaskMapper.getPlantaskById(params.id))[0]
      // 根据当前任务状态启用或禁用任务
      if (task.is_enabled != 1) {
        await taskManager.disableTask(params.id)
      } else {
        await taskManager.scheduleTask(task)
      }
      return apiConfig.success('修改成功')
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('修改失败')
    }
  }

  // 立即执行任务
  public async executeTaskImmediately(c: Context) {
    const apiConfig = new ApiConfig(c)
    const taskId = c.req.param('taskId')
    try {
      //查询当前任务的参数
      const result = await PlantaskMapper.getPlantaskById(taskId)
      const type: string = result[0].type
      if (emailPost.hasOwnProperty(type)) {
        try {
          await taskManager.executeTask(result[0])
        } catch (err: any) {
          return apiConfig.fail(err.message)
        }
      }

      return apiConfig.success(result[0].name + "-执行成功")
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('执行失败')
    }
  }

  //禁用任务
  public async disableTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    const taskId = c.req.param('taskId')

    try {
      await taskManager.disableTask(taskId)
      return apiConfig.success("禁用成功")
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('禁用失败')
    }
  }

  //启用任务
  public async enableTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    const taskId = c.req.param('taskId')
    try {
      await taskManager.enableTask(taskId)
      return apiConfig.success("启用成功")
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('启用失败-' + err)
    }
  }

  //获取所有任务
  public async getAllTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    try {
      return apiConfig.success(await PlantaskMapper.getAllPlantask())
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('获取失败')
    }
  }

  //获取任务日志
  public async getTaskLog(c: Context) {
    const apiConfig = new ApiConfig(c)
    const taskId = c.req.param('taskId')
    try {
      return apiConfig.success(await PlantaskMapper.getTaskLogById(taskId))
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('获取失败')
    }
  }

  //删除任务
  public async deleteTask(c: Context) {
    const apiConfig = new ApiConfig(c)
    const taskId = c.req.param('taskId')
    if (taskId == '24b29cbf-8ada-4c84-be12-0e9828a7fd47' || taskId == 'b4698f2e-464d-48da-bb6e-86de8660867c') {
      return apiConfig.fail('系统任务不可删除')
    }
    try {
      await PlantaskMapper.deletePlantask(taskId)
      return apiConfig.success('删除成功')
    } catch (err) {
      logger.error(err)
      return apiConfig.fail('删除失败')
    }
  }

}

export default new

PlantaskService();
