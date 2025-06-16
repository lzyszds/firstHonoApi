import { Context } from "hono";
import openAI from "../services/openAIService";

// import openAI from "../service/ai.service";

class AiController {

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

  //根据文章id来生成相关的ai评论内容
  async getAiComment(c: Context) {
    return openAI.getAiComment(c)
  }

  // Ai chat
  async sendChat(c: Context) {
    return openAI.sendChat(c);
  }

  // 使用ai来审核评论内容是否符合规范
  async getAiReviewComment(c: Context) {
    return c.json(await openAI.getAiReviewComment(c));
  }

}

export default new AiController();
