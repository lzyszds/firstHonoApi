import ApiConfig from "@/domain/ApiCongfigType";
import ArticleMapper from "@/models/article";
import CommentMapper from "@/models/comment";
import AiMapper from "@/models/openAI";
import { AiUc, AiUcKeys } from "@/domain/AiType";
import { DataTotal } from "@/domain/DataTotal";
import dayjs from "dayjs";
import handleAiFox from "@/utils/handleAiFox";
import { Context } from "hono";
import { streamSSE } from 'hono/streaming'
import CONFIG from "../../config";
import { OpenAI } from "openai";
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
      { role: "user", content: content }
    ];
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
              await stream.writeSSE({ data: char });
            }
          }
        }

        // 将完整结果写入文件
        // await handleAiFox.writeAiTextStore(fullResponse, aid);
      } catch (error) {
        console.error('AI处理错误:', error);
        await stream.writeSSE({ data: '处理过程中发生错误，请稍后重试。' });
      }
    });
  }

  //获取ai列表
  public async getAiList(c: Context): Promise<ApiConfig<DataTotal<AiUc>>> {

    const apiConfig = new ApiConfig<DataTotal<AiUc>>(c);
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
    const apiConfig = new ApiConfig<AiUcKeys[]>(c);
    let { search = "", pages = "1", limit = "10" } = c.req.query();
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
    const { id, ...params } = await c.req.json()
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
    const { id } = await c.req.json()
    const list = await AiMapper.deleteAiKey(id);
    if (list.affectedRows > 0) {
      return apiConfig.success("删除成功")
    } else {
      return apiConfig.fail("删除失败")
    }
  }

  // 根据文章id来生成相关的ai评论内容
  public async getAiComment(c: Context) {
    // 获取文章 ID
    const aid: any = c.req.query('aid')
    const cid: any = c.req.query('cid') || 0;
    let articleInfo: any, commentInfo: any;

    try {
      // 根据文章 ID 获取文章内容
      articleInfo = await ArticleMapper.findArticleInfo(aid);
      if (!articleInfo) {
        return c.text("文章不存在", 404);
      }
      // 根据评论id获取评论内容
      if (cid != 0) {
        commentInfo = await CommentMapper.getCommentInfo(cid);
        if (!commentInfo) {
          return c.text("评论不存在", 404);
        }
      }
    } catch (e) {
      return c.text("获取失败", 404);
    }


    const key = await getAiKey("阿里云硅基Ai");

    const content = '' + articleInfo.content
    let commentContent = '';
    if (cid != 0) {
      commentContent += commentInfo[0].content
    }
    const messages: OpenAI.Chat.ChatCompletionMessageParam[] = [
      {
        role: "system",
        content: `请根据以下文章内容和评论内容:（${commentContent}）生成一段简洁的评论。请不要使用编号列出信息点,要更加人性化一点，不用加以总结，不要超过30个字符`
      },
      { role: "user", content: content }
    ];
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
              await stream.writeSSE({ data: char });
            }
          }
        }

        // 将完整结果写入文件
        // await handleAiFox.writeAiTextStore(fullResponse, aid);
      } catch (error) {
        console.error('AI处理错误:', error);
        await stream.writeSSE({ data: '处理过程中发生错误，请稍后重试。' });
      }
    });
  }

  // Ai chat
  public async sendChat(c: Context) {
    const apiConfig = new ApiConfig<string>(c);
    const { message, messages, baseURL, model } = await c.req.json()
    console.log('messages:', message);

    if (!message || message.length === 0) {
      return apiConfig.fail("消息不能为空");
    }

    const key = await getAiKey("阿里云硅基Ai");


    // 配置 OpenAI 客户端
    const client = new OpenAI({
      apiKey: key,
      baseURL: baseURL || "https://api.siliconflow.cn/v1", // 使用阿里云硅基AI的基础URL
    });

    return streamSSE(c, async (stream) => {
      let fullResponse = '';

      try {
        const completion = await client.chat.completions.create({
          model: model || "Qwen/Qwen2-7B-Instruct", // 使用阿里云硅基AI的模型
          messages: messages,
          stream: true,
        });

        // 后端：发送整个内容块
        for await (const chunk of completion) {
          const content = chunk.choices[0]?.delta?.content || '';
          if (content) {
            fullResponse += content;
            // 直接发送内容，让前端CSS处理换行
            await stream.writeSSE({ data: JSON.stringify(content) });
          }
        }

        // 将完整结果写入文件
        // await handleAiFox.writeAiTextStore(fullResponse, aid);
      } catch (error) {
        console.error('AI处理错误:', error);
        await stream.writeSSE({ data: '处理过程中发生错误，请稍后重试。' });
      }
    });
  }

  // 使用ai来审核评论内容是否符合规范
  public async getAiReviewComment(c: Context, content: string = '') {
    // 获取评论内容
    content = c.req.query('content') || content;
    if (!content) {
      return c.text("评论内容不能为空", 400);
    }

    const key = await getAiKey("阿里云硅基Ai");

    const messages: OpenAI.Chat.ChatCompletionMessageParam[] = [
      {
        role: "system",
        content: "你是一个专业的评论审核员。请判断以下评论内容是否符合规范，规范是指评论内容不包含任何敏感词汇、广告、恶意攻击等不当内容。请回答“符合规范”或“不符合规范”。"
      },
      { role: "user", content: content }
    ];

    // 配置 OpenAI 客户端
    const client = new OpenAI({
      apiKey: key,
      baseURL: "https://api.siliconflow.cn/v1", // 使用阿里云硅基AI的基础URL
    });

    const completion = await client.chat.completions.create({
      model: "Qwen/Qwen2-7B-Instruct", // 使用阿里云硅基AI的模型
      messages: messages,
    });

    const apiConfig = new ApiConfig<string>(c);
    const responseContent = completion.choices[0].message.content;

    if (!responseContent) {
      return apiConfig.fail("无法判断评论内容是否符合规范");
    }

    if (responseContent.includes("不符合规范")) {
      return apiConfig.success("不符合规范");
    } else if (responseContent.includes("符合规范")) {
      return apiConfig.success("符合规范");
    } else {
      return apiConfig.success("不符合规范");
    }
  }
}



export default new openAI();
