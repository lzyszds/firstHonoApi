import { Hono } from "hono";
import articleController from "../../controllers/articleController";
interface Routes {
  [key: string]: { [key: string]: (c: any) => any };
  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}
const router = new Hono();

const routes: Routes = {
  get: {
    // 获取文章列表(后台)
    "/getArticleList": articleController.findAll,
    // 获取文章列表(前台)
    "/getArticleListForWeb": articleController.findArticleList,
    // 根据id获取文章详情
    "/getArticleDetail": articleController.findArticleInfo,
    // 获取文章类型列表
    "/getArticleTypeList": articleController.getArticleTypeList,
    // 随机文章图库
    "/getRandArticleImg": articleController.getRandArticleImg,
  },
  post: {
    // 新增文章
    "/addArticle": articleController.addArticle,
    // 新增文章类型
    "/addArticleType": articleController.addArticleType,
    // 删除文章类型
    "/deleteArticleType": articleController.deleteArticleType,
    // 修改文章
    "/updateArticle": articleController.updateArticle,
    // 上传文章封面
    "/uploadArticleImg": articleController.uploadArticleImg,
    // 删除文章
    "/deleteArticle": articleController.deleteArticle,
    // 禁用文章
    "/disableArticle": articleController.disableArticle,
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
