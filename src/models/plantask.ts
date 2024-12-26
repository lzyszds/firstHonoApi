import db from "../utils/db";
import {Task, TaskLog} from "@/domain/Plantask";
import {OkPacket} from "mysql";

class PlantaskMapper {

    //查看所有已启用的任务
    public async getPlantaskList(): Promise<Task[]> {
        const sql: string = `SELECT *
                             FROM wb_tasks
                             WHERE is_enabled = 1`
        return await db.query(sql, []);
    }

    //根据id查看任务
    public async getPlantaskById(id: string): Promise<Task[]> {
        const sql: string = `SELECT *
                             FROM wb_tasks
                             WHERE id = ?`
        return await db.query(sql, [id]);
    }

    //查看所有任务
    public async getAllPlantask(): Promise<Task[]> {
        const sql: string = `SELECT *
                             FROM wb_tasks`
        return await db.query(sql, []);
    }

    //存储任务
    public async savePlantask(task: Task): Promise<number> {
        const sql: string = `INSERT INTO wb_tasks (id, name, type, cron_expression, is_enabled, params_body)
                             VALUES (?, ?, ?, ?, ?, ?)`
        return await db.query(sql, [task.id, task.name, task.type, task.cron_expression, task.is_enabled, task.params_body]);
    }

    //修改任务
    public async updatePlantask(task: Task): Promise<OkPacket> {
        const sql: string = `UPDATE wb_tasks
                             SET name            = ?,
                                 type            = ?,
                                 cron_expression = ?,
                                 params_body     = ?
                             WHERE id = ?`
        return await db.query(sql, [task.name, task.type, task.cron_expression, task.params_body, task.id]);
    }

    //修改任务最后执行时间
    public async updatePlantaskLastExecutedAt(id: string): Promise<number> {
        const sql: string = `UPDATE wb_tasks
                             SET last_executed_at = NOW()
                             WHERE id = ?`
        return await db.query(sql, [id]);
    }


    //启用或禁用任务
    public async setPlantask(id: string, is_enabled: number): Promise<number> {
        const sql: string = `UPDATE wb_tasks
                             SET is_enabled = ?
                             WHERE id = ?`
        return await db.query(sql, [is_enabled, id]);
    }

    //记录任务执行是否成功 存放日志
    public async saveTaskLogResult(logs: TaskLog): Promise<number> {
        const sql: string = `INSERT INTO wb_task_logs (task_id, status, message, content)
                             VALUES (?, ?, ?, ?)`
        return await db.query(sql, [logs.task_id, logs.status, logs.message, logs.content]);
    }

    //获取全部任务日志
    public async getTaskLog(): Promise<TaskLog[]> {
        const sql: string = `SELECT *
                             FROM wb_task_logs`
        return await db.query(sql, []);
    }

    //根据id获取任务日志
    public async getTaskLogById(task_id: string, limit: number | string): Promise<TaskLog> {
        const sql: string = `SELECT *
                             FROM wb_task_logs
                             WHERE task_id = ? 
                             ORDER BY executed_at DESC
                             LIMIT ?
        `
        return await db.query(sql, [task_id, Number(limit)]);
    }

    //删除任务
    public async deletePlantask(id: string): Promise<OkPacket> {
        const sql: string = `DELETE
                             FROM wb_tasks
                             WHERE id = ?`
        return await db.query(sql, [id]);
    }

}

export default new PlantaskMapper();
