import axios from 'axios';
import { readJsonFile, writeJsonFile } from './helpers';
import CONFIG from '../../config';
import path from 'path';
// 创建 Axios 实例并设置超时
const axiosInstance = axios.create({
  timeout: 5000, // 设定超时为 5 秒
});

export default {
  getAiList: async (content: string, key: string) => {
    try {
      return await axiosInstance.post(CONFIG.aiServiceConfig.url, {
        model: "gpt-3.5-turbo-0125",
        messages: [
          {
            role: "user",
            content: "请从以下文章中总结出一段不要超出100个字的简洁的内容。请不要使用编号列出信息点" + content
          }
        ],
        presence_penalty: 0,
        temperature: 0.5,
        top_p: 1
      }, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${key}`
        },
        timeout: 500000, // 设定超时为 5 秒
      });
    } catch (error: any) {
      console.log(`lzy  error:`, error.message);
      throw new Error('请求失败');
    }
  },
  writeAiTextStore: async (content: string, id: string) => {
    try {
      // 追加内容到指定的文件。如果文件不存在，fs.appendFile 会自动创建文件
      const filePath = path.join(__dirname, `../../static/aiTextStore/${id}.json`);
      let data = await readJsonFile(filePath);
      if (!data) {
        data = [content];
      } else {
        data.push(content);
      }
      await writeJsonFile(filePath, data);
    } catch (err) {
      console.error('写入失败:', err);
    }

  }
}
