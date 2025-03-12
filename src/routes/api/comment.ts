import { Hono } from "hono";
import commentController from "../../controllers/commentController";
interface Routes {
  [key: string]: { [key: string]: (c: any) => any };
  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}
const router = new Hono();

const routes: Routes = {
  get: {
    // 获取指定文章评论
    "/getArticleComment": commentController.getArticleComment,
    // 获取当前系统所有评论
    "/getAllComment": commentController.getAllComment,
    // 获取最新评论
    "/getNewComment": commentController.getNewComment,
    // 获取评论可选头像
    "/getCommentAvatar": commentController.getCommentAvatar,
  },
  post: {
    // 新增评论
    "/addComment": commentController.addComment,
    // 删除评论
    "/deleteComment": commentController.deleteComment,
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
