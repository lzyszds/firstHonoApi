import ApiConfig from "../domain/ApiCongfigType";
import {AdminHomeType, ProcessAdminHomeType} from "../domain/AdminHomeType";
import ToolkotMapper from "../models/toolkit";
import ArticleMapper from "../models/article";
import path from "path";
import fs from "fs";
import IP2Region, {IP2RegionResult} from "ip2region"

import Config from "../../config";
import {WeatherDataType, WeatherDataTypeResponse} from "@/domain/ToolkitType";
import dayjs from "dayjs";
import axios from "axios";
import {Context} from "hono";
import imageUploadResponse from "@/utils/imageUploadResponse";
import {PictureBedType} from "@/domain/PictureBedType";


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
      const filePath = path.resolve(__dirname, '../../static/json/getGithubInfo.json');

      const rawData = fs.readFileSync(filePath, 'utf-8');
      let data: any = JSON.parse(rawData).data,
        totalCount: number,
        month: any[] = []
      const {contributionsCollection} = data.user
      const {weeks, totalContributions} = contributionsCollection.contributionCalendar
      totalCount = totalContributions
      const months: string[] = [
        "一月", "二月", "三月", "四月", "五月", "六月",
        "七月", "八月", "九月", "十月", "十一月", "十二月"
      ]
      weeks.forEach((item: any, index: any) => {
        const date = dayjs(item.firstDay).format('MM')
        if (!month.includes(months[parseInt(date) - 1])) {
          month.push({text: months[parseInt(date) - 1], index: index * 19 + 30})
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

  // 获取github前端项目的提交记录
  public async getGithubFrontCommit(c: Context): Promise<ApiConfig<string>> {
    const apiConfig: ApiConfig<any> = new ApiConfig(c);


    const {token1, token2, token3} = Config.githubUserConfig
    const owner = 'lzyszds';
    const repo = 'blog-admin';

    try {

      const response = await fetch(`https://api.github.com/repos/${owner}/${repo}/commits?per_page=${100}`, {
        headers: {
          'Authorization': `bearer ${token1}${token2}${token3}`,
          'Accept': 'application/vnd.github.v3+json'
        }
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      // 获取数据
      const commits = await response.json();


      const dataMap = new Map()
      // 处理数据
      commits.forEach((item: any) => {
        const message = item.commit.message
        if (!dataMap.has(message)) {
          dataMap.set(message, {
            message: item.commit.message,
            ...item.commit.author
          })
        }
      })
      const data = Array.from(dataMap.values())

      //计算分类所有提交类型的次数
      const typeMap = new Map()

      /*
      * 🎉 init: 初始化
        🚀 release: 发布新版本
        🎨 style: 代码风格修改（不影响代码运行的变动）
        ✨ feat: 添加新功能
        🐛 fix: 修复 bug
        📝 docs: 对文档进行修改
        ♻️ refactor: 代码重构（既不是新增功能，也不是修改 bug 的代码变动）
        ⚡ perf: 提高性能的代码修改
        🧑‍💻 dx: 优化开发体验
        🔨 workflow: 工作流变动
        🏷️ types: 类型声明修改
        🚧 wip: 工作正在进行中
        ✅ test: 测试用例添加及修改
        🔨 build: 影响构建系统或外部依赖关系的更改
        👷 ci: 更改 CI 配置文件和脚本
        ❓ chore: 其它不涉及源码以及测试的修改
        ⬆️ deps: 依赖项修改
        */

      const typeList = [
        {name: "init", title: '初始化', color: '#007C9F', icon: '🎉'},
        {name: "style", title: '代码风格修改', color: '#FBB8AB', icon: '🎨'},
        {name: "feat", title: '添加新功能', color: '#F9C23C', icon: '✨'},
        {name: "fix", title: '修复 bug', color: '#00D26A', icon: '🐛'},
        {name: "docs", title: '对文档进行修改', color: '#F3EEF8', icon: '📝'},
        {name: "refactor", title: '代码重构', color: '#008463', icon: '♻️'},
        {name: "perf", title: '提高性能的代码修改', color: '#696D77', icon: '⚡'},
        {name: "dx", title: '优化开发体验', color: '#FFC83D', icon: '🧑‍💻'},
        {name: "workflow", title: '工作流变动', color: '#7D4533', icon: '🔨'},
        {name: "types", title: '类型声明修改', color: '#FCD53F', icon: '🏷️'},
        {name: "wip", title: '工作正在进行中', color: '#533566', icon: '🚧'},
        {name: "test", title: '测试用例添加及修改', color: '#7D4533', icon: '✅'},
        {name: "build", title: '影响构建系统或外部依赖关系的更改', color: '#7D4533', icon: '🔨'},
        {name: "ci", title: '更改 CI 配置文件和脚本', color: '#00A6ED', icon: '👷'},
        {name: "chore", title: '其它不涉及源码以及测试的修改', color: '#7D4533', icon: '❓'},
        {name: "deps", title: '依赖项修改', color: '#F8312F', icon: '⬆️'},
        {name: "release", title: '发布新版本', color: '#F92F60', icon: '🚀'},
      ]

      data.forEach((item: any) => {
        typeList.forEach((type) => {
          if (item.message.indexOf(type.name) !== -1) {
            if (!typeMap.has(type.name)) return typeMap.set(type.name, 1)
            typeMap.set(type.name, typeMap.get(type.name) + 1)
          }
        })
      })

      return apiConfig.success({
        commits: data,
        typeMap: Array.from(typeMap).map((item, index) => {
          return {
            name: item[0],
            title: typeList.find((type) => type.name === item[0])?.title || '',
            value: item[1],
            color: typeList.find((type) => type.name === item[0])?.color || '#000',
          }
        }),
      })
    } catch (e: any) {
      return apiConfig.fail(e.message)
    }
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
    try {
      const result = await ToolkotMapper.getImageInfo();
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


