import fs from "node:fs"
import path from "node:path"
import CONFIG from "../../config"
import axios from 'axios';

const { token1, token2, token3, name } = CONFIG.githubUserConfig


const body = {
  "query": `query {
            user(login: "${name}") {
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

// 创建目录
const jsonDir = path.resolve(__dirname, '../../static/json');
//打包路径
// const jsonDir = path.resolve(__dirname, './public/json');
if (!fs.existsSync(jsonDir)) {
  fs.mkdirSync(jsonDir, { recursive: true });
}

export async function getGithubInfo() {
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
        "Authorization": `bearer ${token1}${token2}${token3}`,
      },
      data: JSON.stringify(body),
      //返回类型
      responseType: 'text',
    })  // 将响应内容转换为文本格式
    // 解析出getGithubInfo.json文件的完整路径
    const filePath = path.resolve(jsonDir, 'getGithubInfo.json');
    // 将获取到的数据写入到本地文件中
    fs.writeFileSync(filePath, response.data);

    console.log('github数据获取成功');
  } catch (e) {
    console.error("github数据获取失败", e);
  }
}
