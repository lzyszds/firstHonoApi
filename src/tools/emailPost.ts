import fs from "node:fs"
import path from "node:path"
import dayjs from "dayjs";
import emailTools from './emailTools'
import { getGithubInfo } from "./getGIthubInfo";

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
        let isToday = false
        let count = 0
        newWeeks.forEach((item: any) => {
            if (item.date === today) {
                isToday = true
                count = item.contributionCount
            }
        })
        // 今天有提交 不发邮件
        emailTools.mail()
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
