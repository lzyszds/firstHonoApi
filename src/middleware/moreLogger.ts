import { SystemLog } from "@/domain/SystemType"
import systemMapper from "@/models/system"
import { Context } from "hono"
import UserMapper from "@/models/user";


export const moreLogger = async (c: Context, next: () => Promise<void>) => {
  try {
    // 记录请求开始
    const requestStartTime = Date.now()

    // 获取请求信息
    const url = c.req.url
    const method = c.req.method
    const userIp = c.req.header('x-forwarded-for') || c.env.ip || ''
    const traceId = c.get('trace_id')

    // 尝试获取用户信息
    let userId, username
    const token = c.req.header("Authorization")
    console.log(token);

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
      module: url.split('/')[1] || 'unknown', // 从 URL 获取模块名
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
    console.log(logData);


    // 异步写入日志到数据库
    await systemMapper.saveLog(logData)

  } catch (error: any) {
    // 错误日志记录
    const errorLogData: SystemLog = {
      trace_id: c.get('trace_id'),
      log_type: 3, // 错误日志
      user_ip: c.req.header('x-forwarded-for') || c.env.ip || '',
      module: c.req.url.split('/')[1] || 'unknown',
      action: 'ERROR',
      method: c.req.method,
      url: c.req.url,
      request_method: c.req.method,
      execute_time: Date.now() - Number(c.get('start_time') || Date.now()),
      status: 2,
      error_message: error.message
    }

    await systemMapper.saveLog(errorLogData)
    throw error
  }

}