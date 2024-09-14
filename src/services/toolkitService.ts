import ApiConfig from "../domain/ApiCongfigType";
import { AdminHomeType, ProcessAdminHomeType } from "../domain/AdminHomeType";
import ToolkotMapper from "../models/toolkit";
import ArticleMapper from "../models/article";
import path from "path";
import fs from "fs";
import IP2Region, { IP2RegionResult } from "ip2region"

import Config from "../../config";
import { WeatherDataType, WeatherDataTypeResponse } from "../domain/ToolkitType";
import dayjs from "dayjs";
import axios from "axios";
import { Context } from "hono";

class CommonService {
  public async getWeather(c: Context): Promise<ApiConfig<WeatherDataType>> {
    // 创建一个 ApiConfig 对象
    const apiConfig: ApiConfig<WeatherDataType> = new ApiConfig();
    try {
      //获取当前请求的IP地址 
      let ipAddress = c.req.header('x-real-ip') || ""

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
      const { adcode } = await ToolkotMapper.getCityCodeByIp(res?.city!)
      //根据城市编码获取天气预报
      const { data } = await axios(`https://restapi.amap.com/v3/weather/weatherInfo?city=${adcode}&key=${Config.weatherKey}`)
      const weatherData: WeatherDataTypeResponse = data

      weatherData.lives[0].ip = ipAddress
      return apiConfig.success(weatherData.lives[0])
    } catch (e: any) {
      console.log(e)
      return apiConfig.fail(e.message)
    }
  }


  //后台首页数据
  public async getAdminHomeData(): Promise<ApiConfig<ProcessAdminHomeType>> {
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

    const apiConfig: ApiConfig<ProcessAdminHomeType> = new ApiConfig();
    return apiConfig.success(processData);
  }

  //获取github 贡献图
  public async getGithubInfo(): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig<any>();
    try {
      const filePath = path.resolve(__dirname, '../../static/json/getGithubInfo.json');

      const rawData = fs.readFileSync(filePath, 'utf-8');
      let data: any = JSON.parse(rawData).data,
        totalCount = 0,
        month: any[] = []
      const { contributionsCollection } = data.user
      const { weeks, totalContributions } = contributionsCollection.contributionCalendar
      totalCount = totalContributions
      const months: string[] = [
        "一月", "二月", "三月", "四月", "五月", "六月",
        "七月", "八月", "九月", "十月", "十一月", "十二月"
      ]
      weeks.forEach((item: any, index: any) => {
        const date = dayjs(item.firstDay).format('MM')
        if (!month.includes(months[parseInt(date) - 1])) {
          month.push({ text: months[parseInt(date) - 1], index: index * 19 + 30 })
        }
      });


      return apiConfig.success({
        totalCount,
        month,
        weeks,
      })
    } catch (e: any) {
      console.log(e)
      return apiConfig.fail(e.message)
    }
  }
  //诗词内容获取代理接口
  public async getPoetry(): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig<any>();
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

}

export default new CommonService();
