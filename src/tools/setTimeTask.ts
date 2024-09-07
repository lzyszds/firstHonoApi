//项目中的所有定时任务
import { sqlBackupsTask } from './sqlBackupsTask';
import { getGithubInfo } from "./getGIthubInfo";
import { addAiUc } from './aiConfigUc';
import { sendEmailWarn } from './emailPost';
import { createTask, destroyTask } from '@/utils/taskScheduler';
import path from 'path';
import fse from 'fs-extra';


export default () => {
    /*
        30 * * * *: 每小时的第30分钟执行一次
        0 /2 * * *: 每2小时执行一次
        0 9 * * *: 每天早上9点执行一次
        0 0 * * 1: 每周一的午夜执行一次
        * * * * * *   每秒
        0 * * * * * 每分钟
        0 0 * * * * 每小时
        0 0 0 * * * 每天
        0 0 0 0 * * 每月
        0 0 0 * * 0 每周
        0 0 0 0 0 * 每年
        0 10 23 * * * 23点10分0秒
    */

    fse.readJSON(path.join(__dirname, "../../static/config/email.json")).then(res => {
        createTask('dailyEmail', res.planTime, sendEmailWarn); //发送邮件提醒 用于提醒每日是否有在github上提交代码
    })
    createTask('dailySqlBackups', '0 0 1 * * *', sqlBackupsTask);//每日备份数据库
    createTask('dailyGithub', '0 0 0 * * *', getGithubInfo);//每日获取github数据
    createTask('dailyAiUc', '0 0 0 * * *', addAiUc);//每日ai摘要key的使用次数记录表

    // schedule.scheduleJob('0 0 0 * * *', getGithubInfo)    //新增 每日github贡献图数据库
    // schedule.scheduleJob('0 0 0 * * *', addAiUc)          //每日ai摘要key的使用次数记录表
    // schedule.scheduleJob('0 0 12 * * *', getGithubInfo)   //获取github数据 用于获取github贡献图 12点获取
    // schedule.scheduleJob('0 05 18 * * *', getGithubInfo)  //获取github数据 用于获取github贡献图 18点获取
    // schedule.scheduleJob('0 0 0 * * *', sqlBackupsTask)   // 备份数据库定时任务计划 每天凌晨1点执行
}






