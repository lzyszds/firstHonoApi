import { Context } from "hono";
import fse from 'fs-extra';
import path from 'path'
import logger from "@/middleware/logger";
import ApiConfig from "@/domain/ApiCongfigType";
import { createTask, destroyTask } from '@/utils/taskScheduler';
import { sendEmailWarn } from '@/tools/emailPost';

class PlantaskService {
     //获取邮箱定时计划配置
     public async getEmailTaskConfig(c: Context) {
          const apiConfig = new ApiConfig<any>()
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
          const apiConfig = new ApiConfig<any>()
          const params = await c.req.json()
          if (!params.planTime) params.planTime = '0 55 22 * * *'
          try {
               const emailJsonPath = path.join(__dirname, '../../static/config/email.json')
               await fse.writeJson(emailJsonPath, params)
               //销毁之前的定时任务
               destroyTask("dailyEmail");
               //重新启动定时任务
               createTask("dailyEmail", params.planTime, sendEmailWarn)

               return apiConfig.success(await fse.readJson(emailJsonPath))
          } catch (err) {
               logger.error(err)
               return apiConfig.fail('更新失败')
          }
     }

}

export default new PlantaskService();
