import { createLogger, format, transports } from 'winston';
import path from 'path';
import dayjs from 'dayjs';

const logDir = path.join(__dirname, '../../logs/' + dayjs().format('YYYY-MM-DD')); // 日志目录

// 创建日志记录器
const logger = createLogger({
    format: format.combine(
        format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }), // 添加时间戳
        format.errors({ stack: true }), // 记录堆栈跟踪
        format.splat(),
        format.json() // 以 JSON 格式记录日志
    ),
    defaultMeta: { service: 'hono-service' }, // 默认元数据（可选）
    transports: [
        // 文件输出：info 级别日志
        new transports.File({
            filename: path.join(logDir, '/info.log'),
            level: 'info',
            tailable: true,
        }),
        // 文件输出：error 级别日志
        new transports.File({
            filename: path.join(logDir, '/error.log'),
            level: 'error',
        }),
        // 控制台输出：只记录 warn 和 error 级别的日志
        new transports.Console({
            level: 'warn', // 控制台输出的最低级别设置为 warn
            format: format.combine(
                format.colorize(), // 启用颜色输出
                format.simple() // 使用简单格式
            ),
        }),
    ],
});

// 生产环境中禁用控制台日志
if (process.env.NODE_ENV === 'production') {
    logger.remove(new transports.Console());
}

// logger.info('这条日志只会被写入文件');
// logger.warn('这条日志会同时输出到文件和控制台');
// logger.error('这是一个错误！', new Error('错误详情'));
// logger.debug('这条日志不会被记录，因为级别是debug，低于info');

export default logger;