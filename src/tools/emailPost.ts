import fs from "node:fs"
import path from "node:path"
import dayjs from "dayjs";
import emailTools from './emailTools'
import {getGithubInfo} from "./getGIthubInfo";
import {OpenAI} from "openai";
import fse from "fs-extra";


/**
 * 发送GitHub代码提交提醒邮件
 * 功能：检查当天是否有GitHub代码提交，并发送相应的邮件提醒
 * @returns {Promise<void>}
 */
export async function sendEmailWarn() {
  // 从配置文件读取GitHub和情书相关的邮件配置信息
  const {github} = fse.readJSONSync(path.join(__dirname, '../../static/config/email.json'))
  try {
    // 首先获取最新的GitHub提交信息
    await getGithubInfo()

    // 读取GitHub数据文件
    const githubData = fs.readFileSync(path.resolve(__dirname, '../../static/json/getGithubInfo.json'), 'utf-8');
    const data = JSON.parse(githubData)

    // 获取最近一周的贡献数据
    const weeks = data.data.user.contributionsCollection.contributionCalendar.weeks
    const newWeeks = weeks[weeks.length - 1].contributionDays

    // 获取今天的日期
    const today = dayjs().format('YYYY-MM-DD')
    let count = 0

    // 遍历最近一周的贡献数据，检查今天是否有代码提交
    newWeeks.forEach((item: any) => {
      if (item.date === today) {
        count = item.contributionCount
      }
    })

    // 根据当天提交数量生成邮件内容的方法
    const emailHtml = (message: number = 0) => {
      return github.content.replace('${message}', message == 0 ? github.notSubmittedTip : github.submitTip + message)
    }

    // 构建邮件信息
    const mail = emailTools.mail({
      subject: github.subject,
      html: emailHtml(count),
      to: github.toEmail
    })

    // 发送邮件
    emailTools.transporter.sendMail(mail, (err: any, info: any) => {
      if (err) {
        console.log(err);
        return;
      }
      console.log('邮件发送成功', info.messageId);
    });
  } catch (e) {
    console.error("邮件发送失败", e);
  }
}

/**
 * 每日定时发送AI生成的情书
 * 功能：使用OpenAI生成浪漫的情书内容并发送邮件
 * @returns {Promise<void>}
 */
export async function sendEmailLove() {
  // 从配置文件读取GitHub和情书相关的邮件配置信息
  const {loveTetter} = fse.readJSONSync(path.join(__dirname, '../../static/config/email.json'))
  try {
    // 定义AI对话消息数组，包含系统角色设定和用户提示
    const messages: { role: "system" | "user" | "assistant"; content: string }[] = [
      {
        role: "system",
        content: "你是一个专业的情圣,你是一位高级的情感大师，你回答我不要超过200字的内容"
      },
      {
        role: "user",
        content: loveTetter.content
      }
    ];

    // 配置 OpenAI 客户端
    const client = new OpenAI({
      apiKey: loveTetter.aiKey, // OpenAI API密钥
      baseURL: loveTetter.openAiBaseUrl, // 可选的代理地址
    });

    let data
    // 调用OpenAI的聊天完成API生成情书内容
    try {
      data = await client.chat.completions.create({
        model: loveTetter.model, // 使用指定的AI模型
        messages: messages,
        stream: false, // 关闭流式传输
      });
    } catch (e) {
      console.error("情书生成失败,即将使用抱歉语句", e);
    }


    // 构建邮件信息，包含AI生成的情书内容
    const mail = emailTools.mail({
      subject: loveTetter.subject,
      html: data ? data!.choices[0].message.content!.replaceAll("```", "").replace("html", "") + loveTetter.describe : "今天的情书生成失败，请原谅我",
      to: loveTetter.toEmail
    })

    // 发送邮件
    emailTools.transporter.sendMail(mail, (err: any, info: any) => {
      if (err) {
        console.log(err);
        return;
      }
      console.log('邮件发送成功', info.messageId);
    });
  } catch (e) {
    console.error("邮件发送失败", e);
  }
}