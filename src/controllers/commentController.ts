import { Context } from "hono";
import CommentService from "../services/commentService";

class CommentController {

  //获取指定文章评论
  async getArticleComment(c: Context) {
    return c.json(await CommentService.getArticleComment(c));
  }

  //获取当前系统所有评论
  async getAllComment(c: Context) {
    return c.json(await CommentService.getAllComment(c));
  }

  //获取评论可选头像
  async getCommentAvatar(c: Context) {
    return c.json(await CommentService.getCommentAvatar(c));
  }

  //新增评论
  async addComment(c: Context) {
    return c.json(await CommentService.addComment(c));
  }

  //删除评论
  async deleteComment(c: Context) {
    return c.json(await CommentService.deleteComment(c));
  }

  //获取最新评论
  async getNewComment(c: Context) {
    return c.json(await CommentService.getNewComment(c));
  }
}

export default new CommentController();
