import ApiConfig from "../domain/ApiCongfigType";
import SystemMapper from "../models/system";
import path from "path";
import fs from "fs";

import {Footer, FooterSecondary} from "../domain/FooterType";
import {Context} from "hono";
import {checkObj, uploadFileLimit} from "@/utils/helpers";
import logger from "@/middleware/logger";
import {uploadImage} from "@/utils/pictureBed";
import {nanoid} from "nanoid";


class SystemService {

  //获取系统设置
  public async getSystemConfig(c: Context): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig();
    if (checkObj(c.req.query(), ['type'])) {
      return apiConfig.fail('参数type不能为空')
    }
    const type = c.req.query().type
    const params: any = {
      "admin": "admin", //获取所有
      "reception": '4,5', //前台
    }

    try {
      const data = await SystemMapper.getSystemConfig(params[type]);
      return apiConfig.success(data)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //新增系统设置
  public async addSystemConfig(c: any): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig();
    try {
      const params = await c.req.json()
      if (checkObj(params, ['config_key', 'config_value', 'config_desc'])) {
        return apiConfig.fail('参数不能为空 config_key,config_value,config_desc')
      }
      const data = await SystemMapper.addSystemConfig(params);
      return apiConfig.success(data.affectedRows === 1 ? '新增成功' : '新增失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //更新系统设置
  public async updateSystemConfig(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig();
    try {
      const params = await c.req.json()

      if (checkObj(params, ['config_key', 'config_value', 'config_id'])) {
        return apiConfig.fail('参数不能为空 config_key,config_value,config_id')
      }
      const data = await SystemMapper.updateSystemConfig(params);
      return apiConfig.success(data.affectedRows === 1 ? '更新成功' : '更新失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }


  //获取系统公告
  public async getNotification(): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig();
    try {
      const data = await SystemMapper.getNotification();
      return apiConfig.success(data)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //新增页脚信息
  public async addFooterInfo(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig();

    try {
      const params = await c.req.json()
      if (checkObj(c.req.query(), ['footer_type', 'footer_content', 'footer_url', 'footer_order'])) {
        return apiConfig.fail('参数不能为空 footer_type,footer_content,footer_url,footer_order')
      }
      const data = await SystemMapper.addFooterInfo(params);
      return apiConfig.success(data.affectedRows === 1 ? '新增成功' : '新增失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //获取页脚信息
  public async getFooterInfo(): Promise<ApiConfig<FooterSecondary[]>> {
    const apiConfig: ApiConfig<FooterSecondary[]> = new ApiConfig();
    try {
      const data = await SystemMapper.getFooterInfo();
      //处理数据
      let result: FooterSecondary[] = []
      let arr: string[] = data.map((item: Footer) => item.footer_type)
      let set = new Set(arr)
      set.forEach((item: string) => {
        let children = data.filter((child: Footer) => child.footer_type === item)
        result[Number(children[0].footer_order) - 1] = {
          footer_id: children[0].footer_id,
          footer_content: children[0].footer_type,
          footer_order: children[0].footer_order.toString(),
          is_enable: children.find((child: Footer) => child.is_enable === 1) ? 1 : 0,
          children: children.map((child: Footer, index: number) => {
            return {
              ...child,
              footer_order: child.footer_order + '-' + index as any
            }
          })
        }
      })

      return apiConfig.success(result)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //更新页脚信息
  public async updateFooterInfo(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig();

    try {
      const {children} = await c.req.json()
      if (checkObj(await c.req.json(), ['children'])) {
        return apiConfig.fail('参数不能为空 children')
      }
      // 使用 flat 方法简化数组操作
      const arr: Footer[] = children.flatMap((item: FooterSecondary) => item.children);
      const data = await SystemMapper.updateFooterInfo(arr);
      return apiConfig.success("更新成功")
    } catch (e: any) {
      logger.error(e)
      return apiConfig.fail("更新失败")
    }
  }

  //获取loadGif图片列表
  public async getSystemLoadImages(): Promise<ApiConfig<any[]>> {
    const apiConfig: ApiConfig<any[]> = new ApiConfig();
    let data: any[] = []
    try {
      //获取loading数据图片
      let result = fs.readdirSync(path.resolve(__dirname, '../../static/img/loadGif'))
      result = result.sort((a: string, b: string) => {
        return parseInt(a.split('.')[0].replace('loading', '')) - parseInt(b.split('.')[0].replace('loading', ''))
      })
      data = result.map((item: string) => "/static/img/loadGif/" + item)

      return apiConfig.success(data)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //获取懒加载图片
  public async getLazyLoadImage(c: any): Promise<any> {
    try {
      const data = await SystemMapper.getSystemConfig('admin');
      const gifValue = data.filter((item: any) => item.config_key === "load_animation_gif")[0].config_value
      const imgBuffer = fs.readFileSync(path.resolve(__dirname, '../../' + gifValue));
      return imgBuffer
    } catch (e) {
      return e
    }
  }

  // 上传图片至腾讯图库
  public uploadImageToTencent(c: any): Promise<ApiConfig<string>> {
    return new Promise(async (resolve, reject) => {
      const apiConfig: ApiConfig<any> = new ApiConfig();
      let result = "" as any;
      const formData = await c.req.parseBody();
      // 假设文件字段名是 'file'
      let file = formData['upload-image'] as File;
      let buffer = await file.arrayBuffer();
      // 使用 nanoid 生成唯一文件名
      const filename = nanoid() + path.extname(file.name) + '.webp';
      // 上传图片至图库
      uploadImage(formData, filename).then(res => {
        resolve(apiConfig.success(res.data.url))
      }).catch(err => {
        reject(apiConfig.fail(err))
      })


      // 上传图片至本地 进行简单的备份

      // 允许上传的文件类型
      const ALLOWED_FILE_TYPES = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/bmp', 'image/webp', 'image/svg+xml'];
      result = await uploadFileLimit(file, 10, ALLOWED_FILE_TYPES)
      if (typeof result !== 'string') {
        buffer = result;
        const articleImagesPath = `/static/img/articleImages/`
        const uploadPath = path.join(__dirname, '../..', articleImagesPath + filename);

        //@ts-ignore
        fs.writeFileSync(uploadPath, Buffer.from(buffer));
      }
    })
  }
}

export default new SystemService();
