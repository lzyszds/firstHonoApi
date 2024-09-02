import AiMapper from "../models/openAI";
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
