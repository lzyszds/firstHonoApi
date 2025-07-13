//文章接口

import ArticleMapper from '../models/article';
import { ArticleData, Articles, ArticleType } from '@/domain/Articles';
import ApiConfig from '../domain/ApiCongfigType';
import { checkObj, randomUnique, uploadFileLimit, useUserInfoGetData } from '@/utils/helpers';
import path from 'path';
import fs from 'fs';
import { Context } from 'hono';
import { getCookie, setCookie } from 'hono/cookie';
import logger from '../middleware/logger';
import { nanoid } from 'nanoid';
import { random } from 'radash'
import { decodeToken } from '@/utils/authUtils';
import { User } from '@/domain/User';
import md5 from 'md5';
import dayjs from 'dayjs';
import { log } from 'console';
import sharp from 'sharp';

const clearCache = async (c: Context) => {
  /* 删除缓存 */
  c.redis.clearArticlesCache('articles_page')
  c.redis.clearArticlesCache('articles_page_web')
  c.redis.clearArticlesCache('articles_info')
  //延迟1秒
  await new Promise(resolve => setTimeout(resolve, 1000));
}


class ArticleService {

  public async findAll(c: Context) {
    const apiConfig: ApiConfig<ArticleData<Articles[]>> = new ApiConfig(c);
    const { pages = 1, limit = 10, ...params } = c.req.query();


    const token = getCookie(c, 'lzytkn')
    const cachedUserData = await c.redis.get(token!);
    let userInfo
    if (cachedUserData) {
      userInfo = JSON.parse(cachedUserData);
    } else {
      userInfo = decodeToken(token!)
    }

    const cacheKey = `articles_page?pages=${pages}&limit=${limit}&params=` + md5(JSON.stringify(params))
    // 现在可以通过 c.redis 访问 Redis 客户端
    const cachedData = await c.redis.get(cacheKey);

    // 如果缓存存在，直接返回缓存数据
    if (cachedData) {
      return apiConfig.success(useUserInfoGetData(cachedData, userInfo));
    }

    const total: number = await ArticleMapper.getArticleListTotal(params as any);

    const data: Articles[] = await ArticleMapper.findAll(params as any, pages, limit);
    const result = { total: total, data }
    await c.redis.setex(cacheKey, 600, JSON.stringify(result));

    return apiConfig.success(useUserInfoGetData(result, userInfo));
  }


  public async getArticleListForWeb(c: Context) {
    const apiConfig: ApiConfig<ArticleData<Articles[]>> = new ApiConfig(c);
    const { pages = 1, limit = 10, ...params } = c.req.query();
    const cacheKey = `articles_page_web?pages=${pages}&limit=${limit}&params=` + md5(JSON.stringify(params))
    // 现在可以通过 c.redis 访问 Redis 客户端
    const cachedData = await c.redis.get(cacheKey);
    // 如果缓存存在，直接返回缓存数据
    if (cachedData) {
      // console.log("走缓存数据");
      return apiConfig.success(JSON.parse(cachedData));
    }

    const total: number = await ArticleMapper.getArticleListTotal(params as any);

    const data: Articles[] = await ArticleMapper.findArticleList({
      title: '',
      content: '',
      aid: ''
    }, pages, limit);

    const result = { total: total, data }
    await c.redis.setex(cacheKey, 600, JSON.stringify(result));

    return apiConfig.success(result);
  }


  public async findArticleInfo(c: Context) {
    const apiConfig: ApiConfig<Articles> = new ApiConfig(c);
    const { id } = c.req.query();
    const cacheKey = `articles_info_${id}`
    // 现在可以通过 c.redis 访问 Redis 客户端
    const cachedData = await c.redis.get(cacheKey);
    if (cachedData) {
      // 如果缓存存在，直接返回缓存数据
      return apiConfig.success(JSON.parse(cachedData));
    }

    const data: Articles = await ArticleMapper.findArticleInfo(id);
    return apiConfig.success(data);
  }

  public async findArticleTypeAll(c: Context) {

    const data: ArticleType[] = await ArticleMapper.findArticleTypeAll();
    const apiConfig: ApiConfig<ArticleData<ArticleType[]>> = new ApiConfig(c);
    return apiConfig.success({ total: data.length, data });
  }

  /* 文章添加 */
  public async addArticle(c: Context) {
    const params = await c.req.json()
    let { title, content, cover_img, main, tags, partial_content } = params
    if (checkObj(params, ['title', 'content', 'cover_img', 'main', 'tags', 'partial_content'])) {
      const apiConfig = new ApiConfig(c);
      return apiConfig.fail('参数错误,请检查是否有空参数');
    }
    if (cover_img.indexOf('/api/article/getRandArticleImg') == 0) {
      cover_img = `/img/coverRomImg/${getCookie(c, 'randArticleImg')}`;
    }

    /* 随机 生成文章访问量 500 - 1000 */
    const access_count = random(500, 1000)

    //根据token获取uid
    const { uid } = decodeToken(getCookie(c, 'lzytkn')!) as User;
    //获取文章发布时间 2021-08-01 12:00:00
    const create_date = dayjs().format('YYYY/MM/DD HH:mm:ss');
    const queryData = await ArticleMapper.addArticle({
      title, content, cover_img, main, partial_content, uid, create_date, access_count
    });
    //实例化apiConfig
    const apiConfig = new ApiConfig(c);
    //根据文章类型获取文章类型id
    for (let i = 0; i < tags.length; i++) {
      const type = await ArticleMapper.getArticleTypeByName(tags[i]);
      if (type.length === 0) {
        return apiConfig.fail('文章类型不存在');
      } else {
        //将文章id和文章类型id插入到文章类型表
        await ArticleMapper.addArticleTypeByAid(type[0].type_id, queryData.insertId);
      }
    }

    await clearCache(c)
    return apiConfig.success('文章添加成功');
  }

  //添加文章类型
  public async addArticleType(c: Context) {
    const params = await c.req.json()
    if (checkObj(params, ['name'])) {
      const apiConfig = new ApiConfig(c);
      return apiConfig.fail('参数错误');
    }
    const result = await ArticleMapper.addArticleType(params.name)
    const apiConfig = new ApiConfig(c);
    if (result.affectedRows === 1) {
      return apiConfig.success('类型添加成功');
    } else {
      return apiConfig.fail(result);
    }
  }

  //删除文章类型
  public async deleteArticleType(c: Context) {
    const params = await c.req.json()
    if (checkObj(params, ['id'])) {
      const apiConfig = new ApiConfig(c);
      return apiConfig.fail('参数错误');
    }
    const result = await ArticleMapper.deleteArticleType(params.id)
    const apiConfig = new ApiConfig(c);
    if (result.affectedRows === 1) {
      return apiConfig.success('类型删除成功');
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
    }
    return imgBuffer;
  }

  //更新文章
  public async updateArticle(c: Context) {
    const params = await c.req.json()

    //实例化apiConfig
    const apiConfig = new ApiConfig(c);
    if (!params) {
      return apiConfig.fail('内容不曾改变');
    }
    const { tags, aid } = params;

    await ArticleMapper.updateArticle(params)

    if (tags) {
      //根据文章类型获取文章类型id
      for (let i = 0; i < tags.length; i++) {
        const type = await ArticleMapper.getArticleTypeByName(tags[i]);
        if (type.length === 0) {
          return apiConfig.fail('文章类型不存在');
        } else {
          //将文章id和文章类型id插入到文章类型表
          await ArticleMapper.addArticleTypeByAid(type[0].type_id, aid);
        }
      }
    }

    await clearCache(c)
    return apiConfig.success('文章修改成功');
  }


  /**
   *  上传文章图片
   *  @param c 请求对象
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
    const apiConfig = new ApiConfig(c);
    let result: any;
    const formData = await c.req.parseBody();

    // 假设文件字段名是 'file'
    let file = formData['upload-image'] as File;
    let buffer = await file.arrayBuffer();

    // 使用 nanoid 生成唯一文件名
    const filename = nanoid() + path.extname(file.name) + '.webp';
    const articleImagesPath = `/static/img/articleImages/`
    const uploadPath = path.join(__dirname, '../..', articleImagesPath + filename);

    const processedBuffer = Buffer.from(buffer)
    //获取file的Buffer
    const webpBuffer = await sharp(processedBuffer).toFormat('webp').toBuffer()

    //@ts-ignore
    fs.writeFileSync(uploadPath, webpBuffer);
    result = { message: '文件上传成功', filename: articleImagesPath + filename }

    return apiConfig.success(result);
  }

  //删除文章
  public async deleteArticle(c: Context) {
    const params = await c.req.json()

    if (checkObj(params, ['id'])) {
      const apiConfig = new ApiConfig(c);
      return apiConfig.fail('参数错误');
    }
    const result = await ArticleMapper.deleteArticle(params.id)
    const apiConfig = new ApiConfig(c);
    if (result.affectedRows === 1) {
      /* 删除缓存 */
      await clearCache(c)
      return apiConfig.success('文章删除成功');
    } else {
      return apiConfig.fail(result);
    }
  }

  //禁用文章
  public async disableArticle(c: Context) {
    const params = await c.req.json()
    if (checkObj(params, ['id'])) {
      const apiConfig = new ApiConfig(c);
      return apiConfig.fail('参数错误');
    }
    const result = await ArticleMapper.disableArticle(params.id)
    const apiConfig = new ApiConfig(c);
    if (result.affectedRows === 1) {
      //删除缓存
      await clearCache(c)
      return apiConfig.success('文章禁用成功');
    } else {
      return apiConfig.fail(result);
    }
  }

}

export default new ArticleService()
