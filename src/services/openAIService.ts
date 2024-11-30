import ApiConfig from "@/domain/ApiCongfigType";
import ArticleMapper from "@/models/article";
import AiMapper from "@/models/openAI";
import {AiUc, AiUcKeys} from "@/domain/AiType";
import {DataTotal} from "@/domain/DataTotal";
import dayjs from "dayjs";
import handleAiFox from "@/utils/handleAiFox";
import {Context} from "hono";
import {streamSSE} from 'hono/streaming'
import CONFIG from "../../config";
import {OpenAI} from "openai";
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

/*
*  获取ai的key方法
*  @param value string  要查找的值
* */
async function getAiKey(value: string) {
  const aiuc = (await AiMapper.findAiKey(value, 1, 1))[0]
  return aiuc.keyValue
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

    const getResultData: any = async () => {
      try {
        const {data} = await handleAiFox.getAiList(articleInfo.content, key);
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
        await stream.writeSSE({data: item});
        await stream.sleep(CONFIG.aiServiceConfig.sleepTime);
      }
    },)
  }

  // 阿里云硅基Ai
  public async getSiliconflowiAi(c: Context) {
    // 获取文章 ID
    const aid: any = c.req.query('aid') || 21;
    let articleInfo: any;

    try {
      // 根据文章 ID 获取文章内容
      articleInfo = await ArticleMapper.findArticleInfo(aid);
    } catch (e) {
      return c.text("文章不存在", 404);
    }

    const key = await getAiKey("阿里云硅基Ai");

    const content = '' + articleInfo.content;
    const messages: OpenAI.Chat.ChatCompletionMessageParam[] = [
      {
        role: "system",
        content: "你是一个专业的博客文章研究分析师。你将从以下文章中总结出一段不要超出100个字的简洁的内容。请不要使用编号列出信息点"
      },
      {role: "user", content: content}
    ];
    console.log(messages)
    // 配置 OpenAI 客户端
    const client = new OpenAI({
      apiKey: key,
      baseURL: "https://api.siliconflow.cn/v1", // 使用阿里云硅基AI的基础URL
    });

    return streamSSE(c, async (stream) => {
      let fullResponse = '';

      try {
        const completion = await client.chat.completions.create({
          model: "Qwen/Qwen2-7B-Instruct", // 使用阿里云硅基AI的模型
          messages: messages,
          stream: true,
        });

        for await (const chunk of completion) {
          const content = chunk.choices[0]?.delta?.content || '';
          if (content) {
            fullResponse += content;
            // 逐字输出
            for (const char of content) {
              await stream.writeSSE({data: char});
            }
          }
        }

        // 将完整结果写入文件
        await handleAiFox.writeAiTextStore(fullResponse, aid);
      } catch (error) {
        console.error('AI处理错误:', error);
        await stream.writeSSE({data: '处理过程中发生错误，请稍后重试。'});
      }
    });
  }

  //获取ai列表
  public async getAiList(c: Context): Promise<ApiConfig<DataTotal<AiUc>>> {

    const apiConfig = new ApiConfig<DataTotal<AiUc>>(c);
    const {pages, limit} = c.req.query();
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
    const apiConfig = new ApiConfig<AiUcKeys[]>(c);
    let {search = "", pages = "1", limit = "10"} = c.req.query();
    const list = await AiMapper.findAiKey(search, Number(pages), Number(limit));
    return apiConfig.success(list)
  }

  //新增Ai的key
  public async addAiKey(c: Context): Promise<ApiConfig<string>> {
    const apiConfig = new ApiConfig<string>(c);
    const params = await c.req.json()
    const list = await AiMapper.addAiKey(params);
    if (list.affectedRows > 0) {
      return apiConfig.success("新增成功")
    } else {
      return apiConfig.fail("新增失败")
    }
  }

  //修改Ai的key
  public async updateAiKey(c: Context): Promise<ApiConfig<string>> {
    const apiConfig = new ApiConfig<string>(c);
    const {id, ...params} = await c.req.json()
    if (!id) return apiConfig.fail("Id不能为空,当前接口是修改不是新增")
    const list = await AiMapper.updateAiKey(id, params);
    if (list.affectedRows > 0) {
      return apiConfig.success("新增成功")
    } else {
      logger.error(list)
      return apiConfig.fail("新增失败")
    }
  }

  //删除Ai的key
  public async deleteAiKey(c: Context): Promise<ApiConfig<any>> {
    const apiConfig = new ApiConfig<any>(c);
    const {id} = await c.req.json()
    const list = await AiMapper.deleteAiKey(id);
    if (list.affectedRows > 0) {
      return apiConfig.success("删除成功")
    } else {
      return apiConfig.fail("删除失败")
    }
  }


}

export default new openAI();
