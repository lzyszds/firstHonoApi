import { createLogger, format, transports } from 'winston';
import path from 'path';
import dayjs from 'dayjs';
import fs from 'fs';

const logDir = process.env.LOG_DIR || path.join(process.cwd(), 'logs', dayjs().format('YYYY-MM-DD'));

if (!fs.existsSync(logDir)) {
    fs.mkdirSync(logDir, { recursive: true });
}


/*
* infoFilter：
* 我们定义了一个名为 infoFilter 的格式化器。
* 这个格式化器会检查日志的 level 是否为 info，如果不是，则会返回 false，这样 winston 就不会继续处理这条日志，从而实现了对 info.log 的日志过滤。
* 这个格式化器只在 info.log 的 transport 上使用。
* */
const infoFilter = format(info => {
    if (info.level === 'info') {
        return info;
    }
    return false;
});
const logger = createLogger({
    level: 'debug', // 设置 logger 的最低日志级别为 debug
    format: format.combine(
        format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        format.errors({ stack: true }),
        format.splat(),
        format.json()
    ),
    defaultMeta: { service: 'hono-service' },
    transports: [
        new transports.File({
            filename: path.join(logDir, 'info.log'),
            level: 'info', // 设置最低级别
            format: format.combine(
                infoFilter(),
                format.timestamp(),
                format.json()
            )
        }),
        new transports.File({
            filename: path.join(logDir, 'error.log'),
            level: 'error', // error.log 只会记录 error 及以上级别的日志
        }),
        new transports.Console({
            level: 'warn', // 控制台只会记录 warn 及以上级别的日志
            format: format.combine(
                format.colorize(),
                format.simple()
            ),
            silent: process.env.NODE_ENV === 'production'
        }),
    ],
});


// logger.info('这条日志只会被写入文件');
// logger.warn('这条日志会同时输出到文件和控制台');
// logger.error('这是一个错误！', new Error('错误详情'));
// logger.debug('这条日志不会被记录，因为级别是debug，低于info');

export default logger;
