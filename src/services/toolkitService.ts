import ApiConfig from "../domain/ApiCongfigType";
import {AdminHomeType, ProcessAdminHomeType} from "../domain/AdminHomeType";
import ToolkotMapper from "../models/toolkit";
import ArticleMapper from "../models/article";
import IP2Region, {IP2RegionResult} from "ip2region"

import Config from "../../config";
import {WeatherDataType, WeatherDataTypeResponse} from "@/domain/ToolkitType";
import dayjs from "dayjs";
import axios from "axios";
import {Context} from "hono";
import imageUploadResponse from "@/utils/imageUploadResponse";
import {PictureBedType} from "@/domain/PictureBedType";
import {dailyGithub, getGithubCommitHandle} from "@/tools/taskHandleList";


class ToolkotService {


  public async getWeather(c: Context): Promise<ApiConfig<WeatherDataType>> {
    // 创建一个 ApiConfig 对象
    const apiConfig: ApiConfig<WeatherDataType> = new ApiConfig(c);
    try {

      //获取当前请求的IP地址
      let ipAddress = c.env.requestIP(c.req.raw).address
      if (ipAddress === '::1') ipAddress = '180.139.210.51'
      // 创建一个 IP2Region 对象
      const query: IP2Region = new IP2Region();
      // 查询 IP 地址的归属地
      const res: IP2RegionResult | null = query.search(ipAddress);
      if (!res?.province) {
        return apiConfig.success({
          "province": res?.country || "未知",
          "city": "未知",
          "adcode": "未知",
          "weather": "未知",
          "temperature": "未知",
          "winddirection": "未知",
          "windpower": "未知",
          "humidity": "未知",
          "reporttime": dayjs().format('YYYY-MM-DD HH:mm:ss'),
          "temperature_float": "未知",
          "humidity_float": "未知",
          "ip": ipAddress,
        })
      }
      //根据地区获取当前城市编码
      const {adcode} = await ToolkotMapper.getCityCodeByIp(res?.city!)
      //根据城市编码获取天气预报
      const {data} = await axios(`https://restapi.amap.com/v3/weather/weatherInfo?city=${adcode}&key=${Config.weatherKey}`)
      const weatherData: WeatherDataTypeResponse = data

      weatherData.lives[0].ip = ipAddress
      return apiConfig.success(weatherData.lives[0])
    } catch (e: any) {
      console.log(e)
      return apiConfig.fail(e.message)
    }
  }


  //后台首页数据
  public async getAdminHomeData(c: Context): Promise<ApiConfig<ProcessAdminHomeType>> {
    const data: AdminHomeType = await ToolkotMapper.getAdminHomeData();
    //获取最新文章6篇
    const newArticle = await ArticleMapper.findAll('%%', 1, 6);
    //处理数据 不需要返回所有数据 删除对象中的content属性
    newArticle.forEach((item: any) => {
      delete item.content
      delete item.partial_content
    })
    let processData = {} as ProcessAdminHomeType
    for (let key in data) {
      if (key !== 'hotArticle') {
        processData[key] = data[key][0].total
      } else {
        processData[key] = data[key]
      }
    }
    processData.newArticle = newArticle

    const apiConfig: ApiConfig<ProcessAdminHomeType> = new ApiConfig(c);
    return apiConfig.success(processData);
  }


  //获取github 贡献图
  public async getGithubInfo(c: Context): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);
    try {
      let afterGithubData = await c.redis.get('afterGithubData') || {}
      if (afterGithubData) {
        await dailyGithub()
        afterGithubData = (await c.redis.get('afterGithubData'))!
      }
      return apiConfig.success(afterGithubData)
    } catch (e: any) {
      console.log(e)
      return apiConfig.fail(e.message)
    }
  }

  // 获取github前端项目的提交记录
  public async getGithubFrontCommit(c: Context): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);

    let workflowStatus: any = await c.redis.get('workflowStatus')
    if (!workflowStatus) {
      await getGithubCommitHandle()
      workflowStatus = await c.redis.get('workflowStatus')
    }
    return apiConfig.success(JSON.parse(workflowStatus))

  }


  // 诗词内容获取代理接口
  public async getPoetry(c: Context): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig<any>(c);
    let data: any = ''
    try {
      data = await axios({
        url: 'https://v2.jinrishici.com/sentence',
        method: 'get',
        headers: {
          "Cookie": "X-User-Token=8DP8J3/ZLjgyKhasLBO602i+Si43oUIw"
        }
      })
      return apiConfig.success(data.data.data)
    } catch (e: any) {
      return apiConfig.fail(e.message)
    }
  }

  //获取已存进图库中的图片
  public async getPictureBedImageList(c: Context): Promise<ApiConfig<PictureBedType[]>> {
    const apiConfig: ApiConfig<PictureBedType[]> = new ApiConfig(c);
    let {page = 1, limit = 999, type = '%%'} = c.req.query()
    try {
      if (type === 'all') type = '%%'
      const result = await ToolkotMapper.getImageInfo({page, limit, type,})
      return apiConfig.success(result)
    } catch (e: any) {
      return apiConfig.fail(e.message)
    }
  }

  // 上传图片至腾讯图库
  public uploadImageToPictureBed(c: any): Promise<ApiConfig<string>> {
    return imageUploadResponse.uploadImageToPictureBed(c, ToolkotMapper)
  }

  // 删除图库中的图片以及数据库存储中的记录
  public async deletePictureBedImage(c: Context): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<string> = new ApiConfig(c);
    try {
      const {id} = await c.req.json()
      // await deleteImage(resource_id)
      const result = await ToolkotMapper.deleteImage(id);
      if (result.affectedRows === 0) {
        return apiConfig.fail('删除失败')
      }
      return apiConfig.success('删除成功')
    } catch (e: any) {
      return apiConfig.fail(e.message)
    }
  }
}

export default new ToolkotService();


