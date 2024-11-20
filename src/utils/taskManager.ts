// src/utils/taskManager.ts
import {Task} from "@/domain/Plantask";
import {v4 as uuidv4} from 'uuid'
import PlantaskMapper from '@/models/plantask'
import {sendEmailLove, sendEmailWarn} from "@/tools/emailPost";
import {getGithubInfo} from "@/tools/getGIthubInfo";

const schedule = require('node-schedule');


class TaskManager {
  private tasks: Map<string, any> = new Map()

  // 启动时加载任务
  async initTasks() {
    const enabledTasks = await PlantaskMapper.getPlantaskList()

    for (const task of enabledTasks) {
      this.scheduleTask(task)
    }
  }

  // 创建并调度任务
  async scheduleTask(taskConfig: Task) {
    console.log(taskConfig)
    const job = schedule.scheduleJob(taskConfig.cron_expression, async () => {
      try {
        await this.executeTask(taskConfig)
      } catch (error) {
        console.error(`执行任务 ${taskConfig.name} 失败`, error)
      }
    })

    this.tasks.set(taskConfig.id!, job)
    return taskConfig.id!
  }

  // 创建任务
  async createTask(taskConfig: Task) {
    // 存储任务
    taskConfig.id = uuidv4()
    await PlantaskMapper.savePlantask(taskConfig)
    return taskConfig.id
  }

  // 执行具体任务逻辑
  private async executeTask(taskConfig: Task) {
    try {
      switch (taskConfig.type) {
        case 'sendEmailLove':
          await sendEmailLove()
          break
        case 'sendEmailWarn':
          await sendEmailWarn()
          break
        case 'dailyGithub':
          await getGithubInfo()
          break
        default:
          throw new Error(`未知任务类型: ${taskConfig.type} ,只有以下类型：sendEmailLove、sendEmailWarn、dailyGithub`)
      }

      // 记录成功日志
      await PlantaskMapper.saveTaskLogResult({
        task_id: taskConfig.id!,
        status: 'success',
        message: `任务 ${taskConfig.name} 执行成功`
      })

    } catch (error: any) {
      // 记录失败日志
      await PlantaskMapper.saveTaskLogResult({
        task_id: taskConfig.id!,
        status: 'failed',
        message: error.message
      })
      throw error
    }
  }


  // 禁用任务
  async disableTask(taskId: string) {
    const job = this.tasks.get(taskId)
    job?.cancel()

    await PlantaskMapper.setPlantask(taskId, false)

    this.tasks.delete(taskId)
  }

  // 启用任务
  async enableTask(taskId: string) {
    // 从数据库获取任务
    const task = await PlantaskMapper.getPlantaskById(taskId)
    console.log(task.length)
    // 如果任务存在
    if (task.length) {
      this.scheduleTask(task[0])
      // 更新数据库中任务状态status
      await PlantaskMapper.setPlantask(taskId, true)
    } else {
      throw new Error('任务不存在')
    }
  }
}

export const taskManager = new TaskManager()