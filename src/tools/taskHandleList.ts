import dayjs from "dayjs";
import emailTools from './emailTools'
import { getGithubInfo } from "./getGIthubInfo";
import { OpenAI } from "openai";
import redis from "@/utils/redis";
import { CommitRunInfo } from "@/domain/ToolkitType";
import Config from "../../config";
import fse from "fs-extra";
import path from "path";
import { getConfig } from "@/config";


/**
 * 发送GitHub代码提交提醒邮件
 * 功能：检查当天是否有GitHub代码提交，并发送相应的邮件提醒
 * @returns {Promise<void>}
 */
export function sendEmailWarn(body: string): Promise<string> {
    return new Promise(async (resolve, reject) => {
        // 从配置文件读取GitHub和情书相关的邮件配置信息
        const github = JSON.parse(body)
        try {
            // 首先获取最新的GitHub提交信息

            // 读取GitHub数据文件
            const data = JSON.parse(await getGithubInfo())
            console.log(data)

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
                resolve(mail.html);
            });
        } catch (e) {
            console.log(e)
            reject(new Error("邮件发送失败"))
        }
    })
}

/**
 * 每日定时发送AI生成的情书
 * 功能：使用OpenAI生成浪漫的情书内容并发送邮件
 * @returns {Promise<void>}
 */
export function sendEmailLove(body: string): Promise<string> {
    return new Promise(async (resolve, reject) => {
        // 从配置文件读取GitHub和情书相关的邮件配置信息
        const loveTetter = JSON.parse(body)
        try {
            // 定义AI对话消息数组，包含系统角色设定和用户提示
            const messages: { role: "system" | "user" | "assistant"; content: string }[] = [
                {
                    role: "system",
                    content: "你是一个专业的情圣,你是一位高级的情感大师，你回答我不要超过200字的内容"
                },
                {
                    role: "user",
                    content: `假设今天是${dayjs().format('YYYY年MM月DD日')}，那么明天是什么节日？` + loveTetter.content
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
                resolve(mail.html);
            });
        } catch (e) {
            reject(new Error("邮件发送失败"))
        }
    })
}


/*
*  每日获取GitHub贡献图任务
*
* */
export async function dailyGithub() {
    try {
        //获取原始的GitHub数据
        let githubData = await getGithubInfo()
        redis.set('githubData', githubData!, 'EX', 60 * 60 * 24)

        //解析数据
        let data: any = JSON.parse(githubData!).data,
            totalCount: number,
            month: any[] = []
        const { contributionsCollection } = data.user
        const { weeks, totalContributions } = contributionsCollection.contributionCalendar
        totalCount = totalContributions
        const months: string[] = [
            "一月", "二月", "三月", "四月", "五月", "六月",
            "七月", "八月", "九月", "十月", "十一月", "十二月"
        ]
        weeks.forEach((item: any, index: any) => {
            const date = dayjs(item.firstDay).format('MM')
            if (!month.includes(months[parseInt(date) - 1])) {
                month.push({ text: months[parseInt(date) - 1], index: index * 19 + 30 })
            }
        });
        const newData = JSON.stringify({
            totalCount,
            month,
            weeks,
        })
        redis.set('afterGithubData', newData, 'EX', 60 * 60 * 24)
        return newData
    } catch (e) {
        console.error(e)
        return '每日获取GitHub贡献图任务执行失败'
    }
}

/*
*  每日获取GitHub提交信息任务
* */
export async function getGithubCommitHandle() {
    const config = getConfig('github_key')

    const owner = 'lzyszds';
    const repo = 'blog-admin';

    try {
        // 获取工作流运行状态
        const workflowResponse = await fetch(`https://api.github.com/repos/${owner}/${repo}/actions/runs?per_page=100`, {
            headers: {
                'Authorization': `bearer ${config.config_value}`,
                'Accept': 'application/vnd.github.v3+json'
            }
        });

        if (!workflowResponse.ok) {
            throw new Error(`HTTP error! status: ${workflowResponse.status}`);
        }

        const workflowData = await workflowResponse.json();
        const workflowRuns = workflowData.workflow_runs;

        const workflowStatus = {
            total: workflowRuns.length,
            runInfoList: [] as CommitRunInfo[],
        };

        for (const run of workflowRuns) {
            const runInfo: CommitRunInfo = {
                id: run.id,
                name: run.name,
                status: run.status,
                conclusion: run.conclusion,
                commit_sha: run.head_sha,
                commit_message: run.head_commit.message,
                commit_author: run.head_commit.author.name,
                run_url: run.html_url,
                created_at: run.created_at,
                avatar_url: run.actor.avatar_url,
                html_url: 'https://github.com/lzyszds/blog-admin/commit/' + run.head_sha
            };

            workflowStatus.runInfoList.push(runInfo);
        }
        redis.set('workflowStatus', JSON.stringify(workflowStatus), 'EX', 60 * 60 * 24);
        return JSON.stringify(workflowStatus.runInfoList.map((item: any) => item.commit_message))
    } catch (e: any) {
        console.error(e);
        return '每日获取GitHub提交信息任务执行失败';
    }
}


// 获取当前后台管理所用的所有依赖并使用ai进行分析总结
export async function getDependencySummarize(body: string) {
    const loveTetter = JSON.parse(body)
    const filePath = path.join(__dirname, '../../static', 'package.json')
    const json = fse.readFileSync(filePath, 'utf-8')
    // 配置 OpenAI 客户端
    const client = new OpenAI({
        apiKey: loveTetter.aiKey, // OpenAI API密钥
        baseURL: loveTetter.openAiBaseUrl, // 可选的代理地址
    });
    try {
        const data = await client.chat.completions.create({
            model: loveTetter.model, // 使用指定的AI模型
            messages: [
                {
                    role: "system",
                    content: "你将使用中文回答我的问题"
                },
                {
                    role: "user",
                    content: `${json} 将当前内容的依赖给我总结出一个json,我需要你对每一个依赖都进行简单介绍(稍微详细点),并区分开发依赖跟构建依赖，我需要的返回(必须要按照我的格式进行返回,只返回json即可，不用添加任何描述免得破坏了我的json结构),我给你举一个例子{
                          "unplugin-auto-import": {
                            "version": "^2.2.0",
                            "description": "自动导入模块,xxxx",
                            "link": "https://xxx",
                          }
                        }`
                }
            ],

            stream: false, // 关闭流式传输
        });
        return data.choices[0].message.content!.replaceAll("```", "").replace("json", "")
    } catch (e) {
        console.error("情书生成失败,即将使用抱歉语句", e);
    }

}


type EmailPosts = {
    [key: string]: (body: any) => any;  // 或根据实际的函数签名修改
};

export default {
    sendEmailWarn: sendEmailWarn,
    sendEmailLove: sendEmailLove,
    dailyGithub: dailyGithub,
    commitGithub: getGithubCommitHandle,
    dependencySummarize: getDependencySummarize
} as EmailPosts