import ApiConfig from "../domain/ApiCongfigType";
import path from "path";
import fs from "fs";
import IP2Region, { IP2RegionResult } from "ip2region"

import { ArticleData, Articles } from "../domain/Articles";
import { getCurrentUnixTime, parseUserAgent } from "../utils/helpers";
import CommentMapper from "../models/comment";
import { CommentType } from "../domain/CommentType";
import { Context } from "hono";
import logger from "@/middleware/logger";

class CommentService {

  //获取文章评论
  public async getArticleComment(c: Context) {
    const { id } = c.req.query();
    const data: Articles = await CommentMapper.getArticleComment(id);
    const apiConfig: ApiConfig<Articles> = new ApiConfig();
    return apiConfig.success(data);
  }

  //获取所有评论
  public async getAllComment(c: Context) {
    const { search = "", pages = "1", limit = "10" } = c.req.query()
    const data: CommentType[] = await CommentMapper.getAllComment(search, pages, limit);
    const apiConfig: ApiConfig<ArticleData<CommentType[]>> = new ApiConfig();
    return apiConfig.success({ total: data.length, data });
  }

  //获取评论可选头像
  public async getCommentAvatar(c: Context) {
    console.log();
    const pathPrefix = '/static/img/comments'
    // 获取当前服务器的主机名和协议
    const app = c.req.url.split('://')[0] + '://' + c.req.url.split('://')[1].split('/')[0];
    // 遍历文件夹下的所有图片
    const imgs = fs.readdirSync(path.join(__dirname, '../..' + pathPrefix));
    return imgs.map(res => {
      return app + pathPrefix + '/' + res
    });
  }

  //新增评论
  public async addComment(c: Context) {
    const apiConfig: ApiConfig<string> = new ApiConfig();

    try {
      // 遍历文件夹下的所有图片
      const imgs = fs.readdirSync(path.join(__dirname, '../../static/img/comments'));

      // 获取前端传入的参数
      let { content, aid, replyId, groundId, email, name, imgIndex } = await c.req.json()
      // 获取用户ip
      const userIp = c.req.header('x-real-ip') || ""
      //根据用户ip获取用户地址
      // 创建一个 IP2Region 对象
      const query: IP2Region = new IP2Region();
      // 查询 IP 地址的归属地
      const res: IP2RegionResult | null = query.search(userIp);

      //获取评论人的系统信息
      const agent = c.req.header('user-agent');
      //获取设备系统
      const { browserSystem, deviceSystem } = parseUserAgent(agent);
      replyId = replyId || "0";
      groundId = groundId || "0";
      //@ts-ignore 头像地址
      const img: string = `/img/comments/${imgs[imgIndex]}`;
      const nowDate: number = getCurrentUnixTime();
      // 添加评论进数据库
      await CommentMapper.addComment({
        content, aid, replyId, groundId, email, name, userIp: res?.province + "" + res?.city, img, nowDate,
        deviceSystem, browserSystem
      });
      //评论成功后，文章评论数加1
      await CommentMapper.addArticleCommentCount(aid);
      return apiConfig.success("评论成功");
    } catch (err) {
      logger.error(err)
      return apiConfig.fail("评论失败");
    }
  }

  //删除评论
  public async deleteComment(c: Context) {
    const apiConfig: ApiConfig<string> = new ApiConfig();
    try {
      const { ids } = await c.req.json()
      // 删除评论
      await CommentMapper.deleteComment(ids);
      return apiConfig.success("删除成功");
    } catch (e: any) {
      return apiConfig.fail(e.message);
    }
  }

  public async getNewComment(c: Context): Promise<ApiConfig<CommentType[]>> {
    // 创建一个 ApiConfig 对象
    const apiConfig: ApiConfig<CommentType[]> = new ApiConfig();
    try {
      const { limit = "10" } = c.req.query();
      // 获取最新评论
      const data: CommentType[] = await CommentMapper.getNewComment(Number(limit));

      return apiConfig.success(data)
    } catch (e: any) {
      console.log(e)
      return apiConfig.fail(e.message)
    }
  }
}

export default new CommentService();
