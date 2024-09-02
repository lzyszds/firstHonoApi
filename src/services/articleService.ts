//文章接口

import ArticleMapper from "../models/article";
import { ArticleData, Articles, ArticleType } from "../domain/Articles";
import ApiConfig from "../domain/ApiCongfigType";
import { checkObj, randomUnique, uploadFileLimit } from "../utils/helpers";
import path from "path";
import fs from "fs";
import md5 from "md5";
import UserMapper from "../models/user";
import { Context } from "hono";
import { getCookie, setCookie } from "hono/cookie";
import logger from '../middleware/logger';
import { nanoid } from "nanoid";

class ArticleService {

  public async findAll(c: Context) {
    let { search = "", pages = "1", limit = "10" } = c.req.query();
    const total: number = await ArticleMapper.getArticleListTotal(search);

    const data: Articles[] = await ArticleMapper.findAll(search, pages, limit);
    const apiConfig: ApiConfig<ArticleData<Articles[]>> = new ApiConfig();
    return apiConfig.success({ total: total, data });
  }

  public async findArticleInfo(c: Context) {
    const { id } = c.req.query();
    const data: Articles = await ArticleMapper.findArticleInfo(id);
    const apiConfig: ApiConfig<Articles> = new ApiConfig();
    return apiConfig.success(data);
  }

  public async findArticleTypeAll() {

    const data: ArticleType[] = await ArticleMapper.findArticleTypeAll();
    const apiConfig: ApiConfig<ArticleData<ArticleType[]>> = new ApiConfig();
    return apiConfig.success({ total: data.length, data });
  }

  public async addArticle(c: Context) {
    const params = c.req.query();

    let { title, content, cover_img, main, tags, partial_content } = params
    if (checkObj(params, ["title", "content", "cover_img", "main", "tags", "partial_content"])) {
      const apiConfig: ApiConfig<string> = new ApiConfig();
      return apiConfig.fail("参数错误,请检查是否有空参数");
    }
    if (cover_img.indexOf("/api/article/getRandArticleImg") == 0) {
      cover_img = `/img/coverRomImg/${getCookie(c, 'randArticleImg')}`;
    }

    //根据token获取uid
    const { uid } = (await UserMapper.getUserInfoToken(c.req.header("authorization")!))[0];
    //获取文章发布时间 2021-08-01 12:00:00
    const create_date = new Date().toLocaleString();
    const queryData = await ArticleMapper.addArticle({
      title, content, cover_img, main, partial_content, uid, create_date
    });
    //实例化apiConfig
    const apiConfig: ApiConfig<string> = new ApiConfig();
    //根据文章类型获取文章类型id
    for (let i = 0; i < tags.length; i++) {
      const type = await ArticleMapper.getArticleTypeByName(tags[i]);
      if (type.length === 0) {
        return apiConfig.fail("文章类型不存在");
      } else {
        //将文章id和文章类型id插入到文章类型表
        await ArticleMapper.addArticleTypeByAid(type[0].type_id, queryData.insertId);
      }
    }
    return apiConfig.success("文章添加成功");
  }

  //添加文章类型
  public async addArticleType(c: Context) {
    const params = c.req.query();
    if (checkObj(params, ["name"])) {
      const apiConfig: ApiConfig<string> = new ApiConfig();
      return apiConfig.fail("参数错误");
    }
    const result = await ArticleMapper.addArticleType(params.name)
    const apiConfig: ApiConfig<string> = new ApiConfig();
    if (result.affectedRows === 1) {
      return apiConfig.success("类型添加成功");
    } else {
      return apiConfig.fail(result);
    }
  }

  //删除文章类型
  public async deleteArticleType(c: Context) {
    const params = c.req.query();
    if (checkObj(params, ["id"])) {
      const apiConfig: ApiConfig<string> = new ApiConfig();
      return apiConfig.fail("参数错误");
    }
    const result = await ArticleMapper.deleteArticleType(params.id)
    const apiConfig: ApiConfig<string> = new ApiConfig();
    if (result.affectedRows === 1) {
      return apiConfig.success("类型删除成功");
    } else {
      return apiConfig.fail(result);
    }
  }

  //获取随机文章图库
  public async getRandArticleImg(c: Context) {
    let imgBuffer = null
    try {
      // 获取文件夹 public/img/coverRomImg 中的所有图片文件(名字)
      const imgDir = path.join(__dirname, '../../static/img/coverRomImg');
      const imgs = fs.readdirSync(imgDir);

      // 随机数
      const random = randomUnique(0, imgs.length - 1, 0);
      // 获取随机图片
      const img = imgs[random];
      //通过系统中的session存储图片名字 用于后续的文章封面图片
      setCookie(c, 'randArticleImg', img);
      // 返回图片
      const imgPath = path.join(imgDir, img);
      imgBuffer = await fs.promises.readFile(imgPath);
    } catch (err: any) {
      logger.error(err.message);
    } finally {
      return imgBuffer;
    }
  }

  //更新文章
  public async updateArticle(c: Context) {
    const params = c.req.query();

    //实例化apiConfig
    const apiConfig: ApiConfig<string> = new ApiConfig();
    if (!params) {
      return apiConfig.fail("内容不曾改变");
    }
    const { tags, aid } = params;

    await ArticleMapper.updateArticle(params)

    if (tags) {
      //根据文章类型获取文章类型id
      for (let i = 0; i < tags.length; i++) {
        const type = await ArticleMapper.getArticleTypeByName(tags[i]);
        if (type.length === 0) {
          return apiConfig.fail("文章类型不存在");
        } else {
          //将文章id和文章类型id插入到文章类型表
          await ArticleMapper.addArticleTypeByAid(type[0].type_id, aid);
        }
      }
    }
    return apiConfig.success("文章修改成功");

  }



  /**
   *  上传文章图片
   *  @param c 请求对象
   *  @param file 文件对象
   *  @returns 返回上传成功
   *  限制配置: 文件大小限制为10MB
   *  具体的上传图片逻辑
   *  1. 获取上传的文件 只支持图片上传 格式为: jpg, png, webp, jpeg (后续可扩展)
   *  2. 创建可读流 创建可写流
   *  3. 可读流通过管道写入可写流
   *  4. 设置图片名字  保证唯一性 文件md5 转换为16进制
   *  5. 将图片写入到指定文件夹
   *  6. 返回上传成功
   * */
  public async uploadArticleImg(c: Context) {
    //实例化apiConfig
    const apiConfig: ApiConfig<string> = new ApiConfig();
    let result = "" as any;
    const formData = await c.req.parseBody();

    // 假设文件字段名是 'file'
    let file = formData['articleImages'] as File;
    let buffer = await file.arrayBuffer();

    // 允许上传的文件类型
    const ALLOWED_FILE_TYPES = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/bmp', 'image/webp', 'image/svg+xml'];
    result = await uploadFileLimit(file, 10, ALLOWED_FILE_TYPES)
    if (typeof result === 'string') {
      return apiConfig.fail(result);
    } else {
      buffer = result;
    }

    // 使用 nanoid 生成唯一文件名
    const filename = nanoid() + path.extname(file.name);
    const uploadPath = path.join(__dirname, '../../static/img/articleImages', filename);


    fs.writeFileSync(uploadPath, Buffer.from(buffer));
    result = { message: '文件上传成功', filename }

    return apiConfig.success(result);
  }

  //删除文章
  public async deleteArticle(c: Context) {
    const params = c.req.query();

    if (checkObj(params, ["id"])) {
      const apiConfig: ApiConfig<string> = new ApiConfig();
      return apiConfig.fail("参数错误");
    }
    const result = await ArticleMapper.deleteArticle(params.id)
    const apiConfig: ApiConfig<string> = new ApiConfig();
    if (result.affectedRows === 1) {
      return apiConfig.success("文章删除成功");
    } else {
      return apiConfig.fail(result);
    }
  }

}

export default new ArticleService()
