import {SystemLog} from "@/domain/SystemType"
import systemMapper from "@/models/system"
import {Context} from "hono"
import UserMapper from "@/models/user";


export const moreLogger = async (c: Context, next: () => Promise<void>) => {
  // 获取用户 IP
  const userIp = c.req.header('x-forwarded-for') ||
    c.req.header('x-real-ip') ||
    c.env?.incoming?.socket?.remoteAddress ||
    c.req.raw.headers.get('x-forwarded-for')
  // 获取请求信息
  const url = c.req.url
  const method = c.req.method

  // 获取 trace_id
  const traceId = c.get('trace_id')
  //浏览器信息
  const userAgent = c.req.header('user-agent') || ''

  //模块名
  const module = url.split('/')[1] || 'unknown'

  try {
    // 记录请求开始
    const requestStartTime = Date.now()

    // 尝试获取用户信息
    let userId, username
    const token = c.req.header("Authorization")

    if (token) {
      const cachedUserData = await c.redis.get(token!);
      let userInfo
      if (cachedUserData) {
        userInfo = JSON.parse(cachedUserData);
      } else {
        userInfo = (await UserMapper.getUserInfoToken(token || ''))[0]
        await c.redis.set(token!, JSON.stringify(userInfo), 'EX', 86400)
      }
      userId = userInfo.uid
      username = userInfo.username
    }

    // 继续处理请求
    await next()

    // 计算执行时间
    const executeTime = Date.now() - requestStartTime
    // 准备日志数据
    const logData: SystemLog = {
      trace_id: traceId,
      log_type: 1, // 操作日志
      user_id: userId,
      username: username,
      user_ip: userIp,
      user_agent: userAgent,
      module: module, // 从 URL 获取模块名
      action: method,
      method: c.req.header('x-http-method-override') || method,
      url: url,
      request_method: method,
      request_params: JSON.stringify(c.req.query()),
      request_body: JSON.stringify(await c.req.json().catch(() => ({}))),
      response_body: JSON.stringify(c.res.body),
      execute_time: executeTime,
      status: 1
    }


    // 异步写入日志到数据库
    await systemMapper.saveLog(logData)

  } catch (error: any) {
    // 错误日志记录
    const errorLogData: SystemLog = {
      trace_id: traceId,
      log_type: 3, // 错误日志
      user_ip: userIp,
      user_agent: userAgent,
      module: module,
      action: 'ERROR',
      method: method,
      url: url,
      request_method: method,
      execute_time: Date.now() - Number(c.get('start_time') || Date.now()),
      status: 2,
      error_message: error.message
    }

    await systemMapper.saveLog(errorLogData)
    throw error
  }

}