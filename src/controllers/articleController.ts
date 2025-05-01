//文章接口
import ArticleService from "../services/articleService";
import ApiConfig from "../domain/ApiCongfigType";
import { Context } from "hono";

class ArticleController {

    //获取文章列表(后台版本)
    async findAll(c: Context) {
        return c.json(await ArticleService.findAll(c));
    }
    //获取文章列表(前台版本)
    async getArticleListForWeb(c: Context) {
        return c.json(await ArticleService.getArticleListForWeb(c));
    }

    //根据id获取文章详情
    async findArticleInfo(c: Context) {
        return c.json(await ArticleService.findArticleInfo(c));
    }

    //新增文章
    async addArticle(c: Context) {
        return c.json(await ArticleService.addArticle(c));
    }

    //获取文章类型列表
    async getArticleTypeList(c: Context) {
        return c.json(await ArticleService.findArticleTypeAll(c));
    }

    //新增文章类型
    async addArticleType(c: Context) {
        return c.json(await ArticleService.addArticleType(c));
    }

    //删除文章类型
    async deleteArticleType(c: Context) {
        return c.json(await ArticleService.deleteArticleType(c));
    }

    // 随机文章图库
    async getRandArticleImg(c: Context) {
        try {
            const imageBuffer = await ArticleService.getRandArticleImg(c);
            // 设置响应头
            c.header('Content-Type', 'image/jpeg');
            // 设置响应头并返回图片数据
            return c.body(imageBuffer!.buffer as ArrayBuffer);
        } catch (e) {
            console.error(e);
            return c.text('获取图片失败', 500);
        }
    }

    //修改文章
    async updateArticle(c: Context) {
        return c.json(await ArticleService.updateArticle(c));
    }



    //上传图片
    async uploadArticleImg(c: Context) {
        return c.json(await ArticleService.uploadArticleImg(c));
    }

    //删除文章
    async deleteArticle(c: Context) {
        return c.json(await ArticleService.deleteArticle(c));
    }

    //禁用文章
    async disableArticle(c: Context) {
        return c.json(await ArticleService.disableArticle(c));
    }
}

export default new ArticleController();
