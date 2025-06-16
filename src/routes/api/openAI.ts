import { Hono } from "hono";
import openAIController from "../../controllers/openAIController";

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    // 获取ai key列表
    "/getAiKeysList": openAIController.getAiKeysList,
    // 询问阿里云的硅基ai
    "/getSiliconflowiAi": openAIController.getSiliconflowiAi,
    // 根据文章id来生成相关的ai评论内容
    "/getAiComment": openAIController.getAiComment,
    // 使用ai来审核评论内容是否符合规范
    "/getAiReviewComment": openAIController.getAiReviewComment,
  },
  post: {
    // 新增ai key
    "/addAiKey": openAIController.addAiKey,
    // 更新ai key
    "/updateAiKey": openAIController.updateAiKey,
    // 删除ai key
    "/deleteAiKey": openAIController.deleteAiKey,
    // Ai chat 
    "/sendChat": openAIController.sendChat,
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
