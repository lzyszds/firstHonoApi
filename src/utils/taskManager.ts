// src/utils/taskManager.ts
import { Task } from "@/domain/Plantask";
import { v4 as uuidv4 } from 'uuid'
import PlantaskMapper from '@/models/plantask'
import taskHandlers from "@/tools/taskHandleList";

const schedule = require('node-schedule');


class TaskManager {
    private tasks: Map<string, any> = new Map()

    // 启动时加载任务
    async initTasks() {
        if (process.env.TASKS_INITIALIZED) return;
        process.env.TASKS_INITIALIZED = 'true';

        const enabledTasks = await PlantaskMapper.getPlantaskList()
        for (const task of enabledTasks) {
            this.scheduleTask(task)
        }
    }

    // 创建并调度任务
    async scheduleTask(taskConfig: Task) {
        const existingJob = this.tasks.get(taskConfig.id!);

        if (existingJob) {
            // 如果任务已存在，则取消之前的任务
            console.log('任务已存在，取消并重新调度', taskConfig.name);
            existingJob.cancel();
            this.tasks.delete(taskConfig.id!);
        }


        const job = schedule.scheduleJob(taskConfig.cron_expression, async () => {
            try {
                await this.executeTask(taskConfig)
            } catch (error) {
                console.error(`执行任务 ${taskConfig.name} 失败`, error)
            }
        })
        // 将新任务添加到任务集合中
        job.id = taskConfig.id!;
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


    // 执行具体任务逻辑 manualExecution 是否手动执行
    async executeTask(taskConfig: Task, manualExecution: boolean = false) {

        let html = '';
        try {
            const handler = taskHandlers[taskConfig.type];
            const isEmailTask = taskConfig.type == 'sendEmailLove' || taskConfig.type == 'sendEmailWarn'
            if (!manualExecution && isEmailTask) {
                //当天是否已经发送过
                const today = new Date();
                const todayStr = today.toLocaleDateString();
                
                const lastExecutedAt = taskConfig.last_executed_at?.toLocaleDateString();
                // console.log('lastExecutedAt', lastExecutedAt, todayStr)

                if (lastExecutedAt == todayStr) {
                    return console.log('今天已经发送过了')
                }
            }

            html = await handler(taskConfig.params_body) || '';
            // 记录成功日志
            await PlantaskMapper.saveTaskLogResult({
                task_id: taskConfig.id!,
                status: 'success',
                message: `任务 ${taskConfig.name} 执行成功`,
                content: html
            });

            // 更新任务最后执行时间
            if (!manualExecution) await PlantaskMapper.updatePlantaskLastExecutedAt(taskConfig.id!);
        } catch (error: any) {
            // 记录失败日志
            await PlantaskMapper.saveTaskLogResult({
                task_id: taskConfig.id!,
                status: 'failed',
                message: error.message
            });
            throw error;
        }
    }


    // 禁用任务
    async disableTask(taskId: string) {
        const job = this.tasks.get(taskId)
        job?.cancel()

        await PlantaskMapper.setPlantask(taskId, 0)

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
            await PlantaskMapper.setPlantask(taskId, 1)
        } else {
            throw new Error('任务不存在')
        }
    }

    // 清理任务
    async clearTask() {
        for (const job of this.tasks.values()) {
            job.cancel();
        }
        this.tasks.clear();
    }
}

export const taskManager = new TaskManager()