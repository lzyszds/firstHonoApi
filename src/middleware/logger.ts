import { createLogger, format, transports } from 'winston'
import path from 'path'


// 创建日志记录器
const logger = createLogger({
  level: 'info', // 设置日志级别
  format: format.combine(
    format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }), // 添加时间戳
    format.errors({ stack: true }), // 记录堆栈跟踪
    format.splat(),
    format.json() // 以 JSON 格式记录日志
  ),
  defaultMeta: { service: 'hono-service' }, // 默认元数据（可选）
  transports: [
    // 控制台输出
    new transports.Console({
      format: format.combine(
        format.colorize(), // 彩色输出
        format.simple() // 简单格式输出
      )
    }),
    // 文件输出
    new transports.File({ filename: path.join(__dirname, '../../logs/error.log'), level: 'error' }),
    new transports.File({ filename: path.join(__dirname, '../../logs/combined.log') })
  ],
})

// 生产环境中禁用控制台日志
if (process.env.NODE_ENV === 'production') {
  logger.remove(new transports.Console())
}

export default logger
