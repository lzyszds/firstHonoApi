import {Context} from "hono";
import openAI from "../services/openAIService";

// import openAI from "../service/ai.service";

class AiController {

  //GPT3.5开放ai
  async getAifox(c: Context) {
    return openAI.getAifox(c)
  }

  //阿里云的硅基ai
  async getSiliconflowiAi(c: Context) {
    return openAI.getSiliconflowiAi(c)
  }

  //获取ai key列表
  async getAiKeysList(c: Context) {
    return c.json(await openAI.getAiKeysList(c));
  }

  //新增ai key
  async addAiKey(c: Context) {
    return c.json(await openAI.addAiKey(c));
  }

  //更新ai key
  async updateAiKey(c: Context) {
    return c.json(await openAI.updateAiKey(c));
  }

  //删除ai key
  async deleteAiKey(c: Context) {
    return c.json(await openAI.deleteAiKey(c));
  }

}

export default new AiController();
