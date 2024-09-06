

//文章接口
import PlantaskService from "../services/plantaskService";
import { Context } from "hono";


class PlantaskController {

     //获取邮箱定时计划配置
     async getEmailTaskConfig(c: Context) {
          return c.json(await PlantaskService.getEmailTaskConfig(c));
     }

     //更新邮箱定时计划配置
     async updateEmailTaskConfig(c: Context) {
          return c.json(await PlantaskService.updateEmailTaskConfig(c));
     }



}

export default new PlantaskController();
