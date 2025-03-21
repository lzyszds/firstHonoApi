import axios from 'axios';
import { getConfig } from '@/config';




export async function getGithubInfo() {

  const config = getConfig('github_key')

  const body = {
    "query": `query {
              user(login: "lzyszds") {
                name
                contributionsCollection {
                  contributionCalendar {
                    colors
                    totalContributions
                    weeks {
                      contributionDays {
                        color
                        contributionCount
                        date
                        weekday
                      }
                      firstDay
                    }
                  }
                }
              }
            }`
  }

  try {
    /**
     * 从GitHub API获取数据并保存到本地文件
     * @param token1 token的第一部分
     * @param token2 token的第二部分
     * @param token3 token的第三部分
     * @param jsonDir 保存json文件的目录路径
     */
    const url: string = "https://api.github.com/graphql";
    // 使用提供的token和请求体发送POST请求到GitHub GraphQL API
    const response = await axios({
      url,
      method: "POST",
      headers: {
        // 在请求头中加入Authorization信息
        "Authorization": `bearer ${config.config_value}`,
      },
      data: JSON.stringify(body),
      //返回类型
      responseType: 'text',
    })  // 将响应内容转换为文本格式
    // 将响应内容写入redis
    console.log('github数据获取成功');
    return response.data
  } catch (e: any) {
    console.error("github数据获取失败", e.message);
  }
}
