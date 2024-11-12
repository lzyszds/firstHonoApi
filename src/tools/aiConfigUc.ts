import dayjs from "dayjs";
import AiMapper from "../models/openAI";
import ArticleMapper from "../models/article";
import handleAiFox from "@/utils/handleAiFox";
import logger from "@/middleware/logger";
import { sleep } from "@/utils/helpers";
import { Articles } from "@/domain/Articles";
// 新增每日ai摘要key的使用次数记录表
export async function addAiUc() {
  try {
    //先查询是否有今天的数据
    const total: number = await AiMapper.findAiUcByTime(dayjs().format('YYYY-MM-DD') + "%");
    if (total === 0) {
      await AiMapper.addAiUc()
    }
  } catch (e) {
    console.error("ai数据获取失败", e);
  }
}


/* 每日自动获取摘要ai数据 因为GPT_API_free 限制ip了，没办法堆key来做到负载均衡 */
export async function dailyGetAbstractAi() {
  try {
    //获取所有文章内容
    const articleList: Articles[] = await ArticleMapper.findAll("%%", 1, 999999);

    for (let i = 1; i <= (180 / articleList.length); i++) {
      articleList.forEach(async (item: Articles) => {
        await sleep(5000)
        // 获取文章内容
        const content: string = item.content;
        // 调用接口获取摘要
        const { data }: any = await handleAiFox.getAiList(content, "sk-vPMwI4Qv32xSXutKVpJ0xsoL9yEoKMEjki8UOrszoq2MHk6j")
        const result = data.choices[0].message.content;
        // 将结果写入文件
        await handleAiFox.writeAiTextStore(result, item.aid.toString());
        logger.info(`文章${item.aid}摘要获取成功`)
      });
    }

  } catch (error) {
    logger.error("每日获取摘要ai数据失败", error);
  }
}