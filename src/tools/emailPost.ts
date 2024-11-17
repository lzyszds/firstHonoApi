import fs from "node:fs"
import path from "node:path"
import dayjs from "dayjs";
import emailTools from './emailTools'
import { getGithubInfo } from "./getGIthubInfo";
import handleAiFox from "@/utils/handleAiFox";

//发送邮件提醒 用于提醒每日是否有在github上提交代码
export async function sendEmailWarn() {
    try {
        await getGithubInfo()
        const githubData = fs.readFileSync(path.resolve(__dirname, '../../static/json/getGithubInfo.json'), 'utf-8');
        const data = JSON.parse(githubData)
        const weeks = data.data.user.contributionsCollection.contributionCalendar.weeks
        const newWeeks = weeks[weeks.length - 1].contributionDays
        //检查今天是否有提交
        const today = dayjs().format('YYYY-MM-DD')
        let count = 0
        newWeeks.forEach((item: any) => {
            if (item.date === today) {
                count = item.contributionCount
            }
        })
        // 今天有提交 不发邮件
        emailTools.transporter.sendMail(emailTools.mail(count.toString()), (err: any, info: any) => {
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


/* 每日定时发送情书给LJY */
export async function sendEmailLove() {
    try {
        const messages: { role: "system" | "user" | "assistant"; content: string }[] = [
            {
                role: "system",
                content: "你是一个专业的情圣,你是一位高级的情感大师，很会说甜言蜜语"
            },
            {
                role: "user",
                content: "帮我写一个情书，两百字左右，尽量写的顺口，读起来让人爱意满满，如果可以的话，以古代情诗为主题进行整体编写,对方的名字叫做：卢静怡，我的名字：黎智勇"
            }
        ];
        //@ts-ignore
        const data = await handleAiFox.getSiliconflowAi(messages, "sk-ybmwpaxbqfwvgaynwwsbyiohifxrtbqkottuwzdrnztrvgcq")

        const result = data!.choices[0].message.content + "为什么要在每天的晚上23点59分钟发送情书呢？因为我第二天你第一个想到的永远是我!"
        emailTools.transporter.sendMail(emailTools.mail(result ?? "", true), (err: any, info: any) => {
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