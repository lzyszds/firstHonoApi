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
import logger from "@/middleware/logger";

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

    let strConnect = '';
    let strAll = '';
    let partialData = ''; // 声明 partialData 变量
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
    const url: string = 'https://api.chatanywhere.com.cn/v1/chat/completions/';

    let result: any;

    const getResultData = async () => {
      try {
        result = await handleAiFox.getAiList(url, articleInfo.content, key);
      } catch (error) {
        // console.log(`lzy  error:`, error)
        return await getResultData()
      }
    }
    await getResultData()
    // 更新 AI 使用次数
    await AiMapper.updateAiUc(keyName, dayjs().format('YYYY-MM-DD') + "%");

    const textDecoder = new TextDecoder();

    return streamText(c, async (stream) => {
      const reader = result.body.getReader();
      while (true) {
        const { done, value } = await reader.read();
        if (done) {
          break;
        }
        const chunk = textDecoder.decode(value);
        const lines = chunk.split('data: ');
        for (let line of lines) {
          if (line.includes("[DONE]")) continue; // 如果包含 "[DONE]" 字符串则跳过该行
          const str = line
          console.log(`lzy  str:`, str)
          if (!str) break;
          try {
            const resJson: any = JSON.parse(str);
            if (!resJson) {
              break;
            } else {
              stream.write(resJson.choices[0].delta.content);
            }
          } finally {

          }
        }
      }
    })

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
    let { search, pages, limit } = ctx.query;
    search = search || ''
    pages = pages || 1
    limit = limit || 10

    const list = await AiMapper.findAiKey('%' + search + '%', Number(pages), Number(limit));
    apiConfig.success(list)
    return apiConfig
  }

  //新增Ai的key
  public async addAiKey(c: Context): Promise<ApiConfig<string>> {
    const apiConfig = new ApiConfig<string>();
    const { keyName, keyValue } = ctx.request.body;
    const list = await AiMapper.addAiKey(keyName, keyValue);
    apiConfig.success(list)
    return apiConfig
  }

  //删除Ai的key
  public async deleteAiKey(c: Context): Promise<ApiConfig<any>> {
    const apiConfig = new ApiConfig<any>();
    const { id } = ctx.request.body;
    const list = await AiMapper.deleteAiKey(id);
    if (list.affectedRows > 0) {
      apiConfig.success("删除成功")
    }
    return apiConfig
  }


}

export default new openAI();
