import ApiConfig from "@/domain/ApiCongfigType";
import { AdminHomeType, ProcessAdminHomeType } from "@/domain/AdminHomeType";
import ToolkotMapper from "@/models/toolkit";
import ArticleMapper from "@/models/article";
import CommentMapper from "@/models/comment";
import IP2Region, { IP2RegionResult } from "ip2region";
import Config from "../../config";
import { WeatherDataType, WeatherDataTypeResponse } from "@/domain/ToolkitType";
import dayjs from "dayjs";
import axios from "axios";
import { Context } from "hono";
import imageUploadResponse from "@/utils/imageUploadResponse";
import { PictureBedType } from "@/domain/PictureBedType";
import { dailyGithub, getGithubCommitHandle } from "@/tools/taskHandleList";
import { getIpAddress } from "@/utils/getIpAddress";
import fs from "fs";
import path from "path";
import Joi from "joi";
import Logger from "@/middleware/logger"


// 定义默认 IP 信息
const DEFAULT_IP_INFO: WeatherDataType = {
    province: "未知",
    city: "未知",
    adcode: "未知",
    weather: "未知",
    temperature: "未知",
    winddirection: "未知",
    windpower: "未知",
    humidity: "未知",
    reporttime: dayjs().format("YYYY-MM-DD HH:mm:ss"),
    temperature_float: "未知",
    humidity_float: "未知",
    ip: "",
};


// 参数校验 schema
const pictureBedSchema = Joi.object({
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).default(999),
    type: Joi.string().default("%%"),
});


class ToolkotService {


    // 获取天气信息
    public async getWeather(c: Context): Promise<ApiConfig<WeatherDataType>> {
        const apiConfig: ApiConfig<WeatherDataType> = new ApiConfig(c);
        try {
            const ipAddress = await getIpAddress(c);
            const query: IP2Region = new IP2Region();
            const res: IP2RegionResult | null = query.search(ipAddress);


            if (!res?.province) {
                DEFAULT_IP_INFO.ip = ipAddress
                return apiConfig.success(DEFAULT_IP_INFO);
            }

            if (res.country != "中国") {
                DEFAULT_IP_INFO.ip = ipAddress
                DEFAULT_IP_INFO.province = res.country
                DEFAULT_IP_INFO.city = res.country
                return apiConfig.success(DEFAULT_IP_INFO);
            }


            const cityData = await ToolkotMapper.getCityCodeByIp(res.city!);

            const weatherCacheKey = "ipAddress" + cityData.adcode;
            const weatherCacheTime = 1800
            let weatherInfo = await c.redis.get(weatherCacheKey);


            if (weatherInfo) {
                return apiConfig.success(JSON.parse(weatherInfo));
            }


            const { data } = await axios(
                `https://restapi.amap.com/v3/weather/weatherInfo?city=${cityData.adcode}&key=${Config.weatherKey}`
            );
            const weatherData: WeatherDataTypeResponse = data;
            weatherData.lives[0].ip = ipAddress;


            await c.redis.set(
                weatherCacheKey,
                JSON.stringify(weatherData.lives[0]),
                "EX",
                weatherCacheTime
            );


            return apiConfig.success(weatherData.lives[0]);
        } catch (e: any) {
            Logger.error(e); // 记录详细的错误信息
            return apiConfig.fail("获取天气信息失败");
        }
    }


    // 获取后台首页数据
    public async getAdminHomeData(c: Context): Promise<ApiConfig<ProcessAdminHomeType>> {
        const apiConfig: ApiConfig<ProcessAdminHomeType> = new ApiConfig(c);
        try {
            const [data, newArticle] = await Promise.all([
                ToolkotMapper.getAdminHomeData(),
                ArticleMapper.findAll({ title: "", content: "", aid: "" }, 1, 6),
            ]);
            // 处理数据 不需要返回所有数据 删除对象中的content属性
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
            return apiConfig.success(processData);
        } catch (e: any) {
            Logger.error("Error in getAdminHomeData:", e);
            return apiConfig.fail('获取首页数据失败')
        }


    }


    // 获取 github 贡献图
    public async getGithubInfo(c: Context): Promise<ApiConfig<string>> {
        const apiConfig: ApiConfig<any> = new ApiConfig(c);
        try {
            let afterGithubData = await c.redis.get('afterGithubData') || {}

            if (!afterGithubData) {
                await dailyGithub()
                afterGithubData = (await c.redis.get('afterGithubData'))!
            }
            return apiConfig.success(afterGithubData)
        } catch (e: any) {
            Logger.error("Error in getGithubInfo:", e);
            return apiConfig.fail('获取github贡献图失败')
        }
    }


    // 获取github前端项目的提交记录
    public async getGithubFrontCommit(c: Context): Promise<ApiConfig<string>> {
        const apiConfig: ApiConfig<any> = new ApiConfig(c);
        try {
            let workflowStatus: any = await c.redis.get('workflowStatus')
            if (!workflowStatus) {
                await getGithubCommitHandle()
                workflowStatus = await c.redis.get('workflowStatus')
            }
            return apiConfig.success(JSON.parse(workflowStatus))
        } catch (e: any) {
            Logger.error("Error in getGithubFrontCommit:", e);
            return apiConfig.fail('获取github提交记录失败')
        }
    }


    // 获取诗词内容
    public async getPoetry(c: Context): Promise<ApiConfig<string>> {
        const apiConfig: ApiConfig<any> = new ApiConfig<any>(c);
        try {
            const { data } = await axios({
                url: "https://v2.jinrishici.com/sentence",
                method: "get",
                headers: {
                    Cookie: "X-User-Token=8DP8J3/ZLjgyKhasLBO602i+Si43oUIw",
                },
            });
            return apiConfig.success(data.data.data);
        } catch (e: any) {
            Logger.error("Error in getPoetry:", e);
            return apiConfig.fail('获取诗词内容失败')
        }
    }


    // 获取已存进图库中的图片
    public async getPictureBedImageList(c: Context): Promise<ApiConfig<PictureBedType[]>> {
        const apiConfig: ApiConfig<PictureBedType[]> = new ApiConfig(c);
        try {
            const { value, error } = pictureBedSchema.validate(c.req.query());
            if (error) {
                return apiConfig.fail(error)
            }
            let { page, limit, type } = value;
            if (type === "all") type = "%%";
            const result = await ToolkotMapper.getImageInfo({ page, limit, type });
            return apiConfig.success(result);
        } catch (e: any) {
            Logger.error("Error in getPictureBedImageList:", e);
            return apiConfig.fail('获取图库图片列表失败')
        }
    }


    // 上传图片至腾讯图库
    public uploadImageToPictureBed(c: any): Promise<ApiConfig<string>> {
        return imageUploadResponse.uploadImageToPictureBed(c, ToolkotMapper);
    }


    // 删除图库中的图片以及数据库存储中的记录
    public async deletePictureBedImage(c: Context): Promise<ApiConfig<string>> {
        const apiConfig: ApiConfig<string> = new ApiConfig(c);
        try {
            const { id } = await c.req.json();
            const [queryResult, delResult] = await ToolkotMapper.deleteImage(id);
            if (delResult.affectedRows === 0) {
                return apiConfig.fail("删除失败");
            }

            try {
                // 将图片从本地删除
                fs.unlinkSync(path.join(__dirname, "../../static/img/cacheImage", queryResult.name));
            } catch (e: any) {
                console.log(path.join(__dirname, "../../static/img/cacheImage", queryResult.name));
                Logger.error("Error in deletePictureBedImage delete file fail:", e)
            }
            return apiConfig.success("删除成功");
        } catch (e: any) {
            Logger.error("Error in deletePictureBedImage:", e);
            return apiConfig.fail('删除图库图片失败')
        }
    }

    // 清空redis中所有缓存
    public async clearRedisCacheAll(c: Context): Promise<ApiConfig<string>> {
        const apiConfig: ApiConfig<string> = new ApiConfig(c);
        try {
            const result = await c.redis.flushall();
            if (result === "OK") {
                return apiConfig.success("清空缓存成功");
            } else {
                return apiConfig.fail("清空缓存失败");
            }
        } catch (e: any) {
            Logger.error("Error in clearReidsCacheAll:", e);
            return apiConfig.fail('清空redis缓存失败')
        }
    }
}


export default new ToolkotService();