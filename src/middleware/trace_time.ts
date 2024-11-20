import { Context } from "hono"
import { v4 as uuidv4 } from 'uuid'

// 中间件：添加 trace_id 和计时
export const addTraceId = async (c: Context, next: () => Promise<void>) => {
  // 生成 trace_id
  const traceId = uuidv4()
  c.set('trace_id', traceId)

  // 设置开始时间
  const startTime = Date.now()

  // 继续处理请求
  await next()

  // 计算执行时间
  const executeTime = Date.now() - startTime
  c.set('execute_time', executeTime)
}