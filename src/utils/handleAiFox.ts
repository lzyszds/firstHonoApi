import axios from 'axios';
import { appendToFile, readJsonFile, writeJsonFile } from './helpers';
import CONFIG from '../../config';
import path from 'path';
import fs from 'fs';
import { OpenAI } from "openai";


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
                        content: content
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

    getSiliconflowAi: async (messages: any[], key: string) => {
        try {

            // 配置 OpenAI 客户端
            const client = new OpenAI({
                apiKey: key, // 替换为你的 OpenAI API 密钥
                baseURL: "https://api.siliconflow.cn/v1", // 如果需要代理访问，设置为代理地址
            });


            // 定义消息内容（确保使用正确的类型）


            return await client.chat.completions.create({
                model: "Qwen/Qwen2-7B-Instruct", // 替换为实际模型名称
                messages: messages,
                stream: false, // 开启流式传输
            });
        } catch (error: any) {
            console.error("请求失败:", error.message);
        }
    },

    writeAiTextStore: async (content: string, id: string) => {
        try {
            // 追加内容到指定的文件
            const filePath = path.join(__dirname, `../../static/aiTextStore/${id}.json`);
            // 如果文件不存在，自动创建文件
            if (!fs.existsSync(filePath)) {
                await writeJsonFile(filePath, []);
            }

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
