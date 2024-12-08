import nodemailer from 'nodemailer';


const emailConfig = {
  "auth_pass": "tijuryafqckkdbfg",
  "myEmail": "lzyszds2048@foxmail.com",
  "myName": "lzyszds",
  "host": "smtp.qq.com",
  "service": "gmail",
  "port": 465,
  "secure": true
}

// 创建一个SMTP客户端配置
const config = {
  // service: emailConfig.service,//服务方式
  host: emailConfig.host,
  port: emailConfig.port,
  secure: emailConfig.secure, // true for 465, false for other ports
  auth: {
    // 发件人邮箱账号
    user: emailConfig.myEmail,
    //发件人邮箱的授权码 这里可以通过qq邮箱获取 并且不唯一
    pass: emailConfig.auth_pass
  }
}

const transporter = nodemailer.createTransport(config)

const mail: any = (params: { subject: string, to: string, html: string }) => {

  return {
    // 发件人 邮箱  '昵称<发件人邮箱>'
    from: `${emailConfig.myName}<${emailConfig.myEmail}>`,
    // 主题
    subject: params.subject,
    // 收件人 的邮箱 可以是其他邮箱 不一定是qq邮箱
    to: params.to,
    //这里可以添加html标签
    html: params.html
  }
}

export default {
  transporter,
  mail
}




