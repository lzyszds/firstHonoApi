import ApiConfig from '../domain/ApiCongfigType';
import SystemMapper from '../models/system';
import path from 'path';
import fs from 'fs';

import {Footer, FooterSecondary} from '@/domain/FooterType';
import {Context} from 'hono';
import {checkObj, parseLogString} from '@/utils/helpers';
import logger from '@/middleware/logger';
import dayjs from 'dayjs';
import {fileURLToPath} from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

class SystemService {

  //获取系统设置
  public async getSystemConfig(c: Context): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
    if (checkObj(c.req.query(), ['type'])) {
      return apiConfig.fail('参数type不能为空')
    }
    const type = c.req.query().type
    const params: any = {
      'admin': 'admin', //获取所有
      'reception': '4,5', //前台
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
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
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
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
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
  public async getNotification(c: Context): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
    try {
      const data = await SystemMapper.getNotification();
      return apiConfig.success(data)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //新增页脚信息
  public async addFooterInfo(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);

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

  //新增二级页脚信息
  public async addFooterLink(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);

    try {
      const params = await c.req.json()
      if (checkObj(c.req.query(), ['category_id', 'name', 'url', 'sort_order', 'status'])) {
        return apiConfig.fail('参数不能为空 category_id,name,url,sort_order,status')
      }
      const data = await SystemMapper.addFooterLink(params);
      return apiConfig.success(data.affectedRows === 1 ? '新增成功' : '新增失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //获取页脚信息
  public async getFooterInfo(c: Context): Promise<ApiConfig<WbFooterResult[]>> {
    const apiConfig: ApiConfig<WbFooterResult[]> = new ApiConfig(c);
    try {
      const data = await SystemMapper.getFooterInfo();
      //处理数据
      const results: WbFooterResult[] = data.map(row => ({
        ...row,
        children: row.children ? JSON.parse(row.children as any) : []
      }));

      // 给所有child的sort_order更换值
      results.forEach((item: WbFooterResult) => {
        item.children.forEach((child: WbFooterLink) => {
          child.sort_order = item.sort_order + '-' + child.sort_order
        })
      })


      return apiConfig.success(results)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //更新页脚一级分类信息
  public async updateFooterCategory(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);

    try {
      const params = await c.req.json()
      if (checkObj(params, ['id', 'name', 'sort_order', 'status'])) {
        return apiConfig.fail('参数不能为空 id,name,sort_order,status')
      }
      const data = await SystemMapper.updateFooterCategory(params);
      return apiConfig.success(data.affectedRows === 1 ? '更新成功' : '更新失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //更新页脚二级分类信息
  public async updateFooterLink(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);

    try {
      const params = await c.req.json()
      if (checkObj(params, ['id', 'name', 'url', 'sort_order', 'status'])) {
        return apiConfig.fail('参数不能为空 id,name,url,sort_order,status')
      }
      const data = await SystemMapper.updateFooterLink(params);
      return apiConfig.success(data.affectedRows === 1 ? '更新成功' : '更新失败')
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }


  //更新页脚信息
  public async updateFooterInfo(c: any): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);

    try {
      const {children} = await c.req.json()
      if (checkObj(await c.req.json(), ['children'])) {
        return apiConfig.fail('参数不能为空 children')
      }
      // 使用 flat 方法简化数组操作
      const arr: Footer[] = children.flatMap((item: FooterSecondary) => item.children);
      /*const data = */
      await SystemMapper.updateFooterInfo(arr);
      return apiConfig.success('更新成功')
    } catch (e: any) {
      logger.error(e)
      return apiConfig.fail('更新失败')
    }
  }

  //获取loadGif图片列表
  public async getSystemLoadImages(c: Context): Promise<ApiConfig<any[]>> {
    const apiConfig: ApiConfig<any[]> = new ApiConfig(c);
    let data: any[] = []
    try {
      //获取loading数据图片
      let result = fs.readdirSync(path.resolve(__dirname, '../../static/img/loadGif'))
      result = result.sort((a: string, b: string) => {
        return parseInt(a.split('.')[0].replace('loading', '')) - parseInt(b.split('.')[0].replace('loading', ''))
      })
      data = result.map((item: string) => '/static/img/loadGif/' + item)

      return apiConfig.success(data)
    } catch (e: any) {
      return apiConfig.fail(e)
    }
  }

  //获取懒加载图片
  public async getLazyLoadImage(_c: any): Promise<any> {
    try {
      const data = await SystemMapper.getSystemConfig('admin');
      const gifValue = data.filter((item: any) => item.config_key === 'load_animation_gif')[0].config_value
      return fs.readFileSync(path.resolve(__dirname, '../../' + gifValue))
    } catch (e) {
      return e
    }
  }

  //获取系统日志
  public async getSystemLog(c: any): Promise<ApiConfig<any>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
    const newDate = dayjs().format('YYYY-MM-DD')
    const params = await c.req.query()
    const {type = 'info', date = newDate, page, limit} = params
    try {

      const logDir = path.resolve(__dirname, '../../logs'); // 假设 logs 文件夹在你的源代码根目录下
      const logFilePath = path.resolve(logDir, date);
      if (!fs.existsSync(logFilePath)) {
        return apiConfig.success([]);
      }

      let data: any = fs.readFileSync(logFilePath + `\\${type}.log`, 'utf-8');
      data = parseLogString(data)
        .filter((item: any): boolean => !!item)
        .reverse()
        .map((item) => {
          try {
            return {
              ...item,
              time: item.timestamp,
              level: item.level,
              message: JSON.parse(item.message),
            }
          } catch {
            return {
              ...item,
              time: item.timestamp,
              level: item.level,
              message: item.message,
            }
          }
        })

      // 分页
      const result = {
        total: data.length,
        data: data.slice((page - 1) * limit, page * limit)
      }

      return apiConfig.success(result);
    } catch (e: any) {
      logger.error(e);
      return apiConfig.fail('获取日志失败')
    }
  }
}

export default new SystemService();
