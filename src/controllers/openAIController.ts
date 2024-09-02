import { Context } from "hono";
import openAI from "../services/openAIService";

// import openAI from "../service/ai.service";

class AiController {

  //GPT3.5开放ai
  public getAifox(c: Context) {
    // c.status = 200;
    // // 处理流式请求
    // c.respond = false; // 禁用 Koa 的内置响应处理
    // c.type = 'text/plain'; // 设置响应头为文本类型
    return openAI.getAifox(c)
  }

  //获取ai key列表
  public getAiKeysList(c: Context) {
    return openAI.getAiKeysList(c);
  }

  //新增ai key
  public addAiKey(c: Context) {
    return openAI.addAiKey(c);
  }

  //删除ai key
  public deleteAiKey(c: Context) {
    return openAI.deleteAiKey(c);
  }


}

export default new AiController();
