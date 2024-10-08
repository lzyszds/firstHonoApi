import nodemailer from 'nodemailer';
import fse from 'fs-extra';
import path from 'path';


const emailConfig = fse.readJSONSync(path.join(__dirname, '../../static/config/email.json'))
var emailHtml = (message: string = '你今天还未在github上提交代码') => {
  return emailConfig.content
}



// 创建一个SMTP客户端配置
const config = {
  service: emailConfig.service,
  auth: {
    // 发件人邮箱账号
    user: emailConfig.myEmail,
    //发件人邮箱的授权码 这里可以通过qq邮箱获取 并且不唯一
    pass: emailConfig.auth_pass  //mthbvhdnfivzvnfj谷歌邮箱
  }
}

const transporter = nodemailer.createTransport(config)

const mail = (message?: string) => {
  return {
    // 发件人 邮箱  '昵称<发件人邮箱>'
    from: `${emailConfig.myName}<${emailConfig.myEmail}>`,
    // 主题
    subject: 'lzy每日提醒',
    // 收件人 的邮箱 可以是其他邮箱 不一定是qq邮箱
    to: 'lzyszds@qq.com',
    //这里可以添加html标签
    html: emailHtml(message),

  }
}

export default {
  transporter,
  mail
}




