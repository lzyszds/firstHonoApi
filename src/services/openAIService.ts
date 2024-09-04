import ApiConfig from "@/domain/ApiCongfigType";
import ArticleMapper from "@/models/article";
import { Readable } from "stream";
import AiMapper from "@/models/openAI";
import { AiUc, AiUcKeys } from "@/domain/AiType";
import { DataTotal } from "@/domain/DataTotal";
import dayjs from "dayjs";
import handleAiFox from "@/utils/handleAiFox";
import { Context } from "hono";
import { streamText, streamSSE } from 'hono/streaming'
import { sleep } from "bun";
import CONFIG from "../../config";

/*
    * 获取ai的key方法
    * 1.根据使用次数排序
    * 2.使用次数最小的key先使用 让其使用次数增加
    * 3.确保每次使用的key使用次数都是最小的
    * 4.这样可以保证每个key的使用次数都是平均的
    * */
async function SelkeysBasedOnUsageFrequency(): Promise<string[]> {
  const aiuc = (await AiMapper.findAiList(1, 10000))[0]
  let list: any = [];
  for (let key in aiuc) {
    if (key == 'id' || key == 'created_at') continue;
    //@ts-ignore
    if (list.length != 0 && aiuc[key] < aiuc[list[0]] && aiuc[key] < 150) {
      list.unshift(key)
    } else {
      list.push(key)
    }
  }
  const aiucKey = await AiMapper.findAiKey(list[0])
  return [aiucKey[0].keyValue, aiucKey[0].keyName]
}

class openAI {


  // GPT-3.5 OpenAI
  public async getAifox(c: Context) {

    // 获取文章 ID
    const aid: any = c.req.query().aid || 21;
    let articleInfo: any;

    try {
      // 根据文章 ID 获取文章内容
      articleInfo = await ArticleMapper.findArticleInfo(aid);
    } catch (e) {
      return "文章不存在";
    }

    const [key, keyName] = await SelkeysBasedOnUsageFrequency();

    let result: any;

    const getResultData = async () => {
      try {
        const { data } = await handleAiFox.getAiList(articleInfo.content, key);
        result = data.choices[0].message.content;
        // 将结果写入文件
        await handleAiFox.writeAiTextStore(result, aid);
      } catch (error) {
        return await getResultData()
      }
    }
    await getResultData()
    // 更新 AI 使用次数
    await AiMapper.updateAiUc(keyName, dayjs().format('YYYY-MM-DD') + "%");

    return streamSSE(c, async (stream) => {
      for (let item of result) {
        await stream.writeSSE({ data: item });
        await stream.sleep(CONFIG.aiServiceConfig.sleepTime);
      }
    },)
  }
  //获取ai列表
  public async getAiList(c: Context): Promise<ApiConfig<DataTotal<AiUc>>> {

    const apiConfig = new ApiConfig<DataTotal<AiUc>>();
    const { pages, limit } = c.req.query();
    const total = await AiMapper.findAiListTotal();
    const list = await AiMapper.findAiList(Number(pages), Number(limit));
    apiConfig.success({
      data: list,
      total
    })
    return apiConfig
  }

  //获取指定Ai的key
  public async getAiKeysList(c: Context): Promise<ApiConfig<AiUcKeys[]>> {
    const apiConfig = new ApiConfig<AiUcKeys[]>();
    let { search = "", pages = "1", limit = "10" } = c.req.query();
    const list = await AiMapper.findAiKey(search, Number(pages), Number(limit));
    return apiConfig.success(list)
  }

  //新增Ai的key
  public async addAiKey(c: Context): Promise<ApiConfig<string>> {
    const apiConfig = new ApiConfig<string>();
    const { keyName, keyValue } = await c.req.json()
    const list = await AiMapper.addAiKey(keyName, keyValue);
    if (list.affectedRows > 0) {
      return apiConfig.success("新增成功")
    } else {
      return apiConfig.fail("新增失败")
    }
  }

  //删除Ai的key
  public async deleteAiKey(c: Context): Promise<ApiConfig<any>> {
    const apiConfig = new ApiConfig<any>();
    const { id } = await c.req.json()
    const list = await AiMapper.deleteAiKey(id);
    if (list.affectedRows > 0) {
      return apiConfig.success("删除成功")
    } else {
      return apiConfig.fail("删除失败")
    }
  }


}

export default new openAI();
