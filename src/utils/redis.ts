import Redis from 'ioredis';
import Config from '../../config';
// 扩展 Context 类型
declare module 'ioredis' {
  interface Redis {
    clearArticlesCache: (text: string) => void;
  }
}

// 创建 Redis 客户端实例
const redis = new Redis({
  host: Config.dbConfig.host, // Redis 服务地址，默认为 localhost
  port: 6379,        // Redis 服务端口，默认为 6379
  // 如果你有密码设置，可以加上 password 字段
  // password: 'your_password',
  db: 1, // 使用的 Redis 数据库，默认为 0
});

redis.clearArticlesCache = (text) => {
  try {
    // 使用 SCAN 命令查找所有匹配的键
    const stream = redis.scanStream({
      match: text + '*',
      count: 100
    });

    stream.on('data', (keys) => {
      if (keys.length) {
        // 删除找到的键
        const pipeline = redis.pipeline();
        keys.forEach((key: any) => {
          pipeline.del(key);
        });
        pipeline.exec();
      }
    });

    stream.on('end', () => {
      console.log('所有 articles_page 相关的缓存已清除');
    });
  } catch (error) {
    console.error('清除缓存时出错:', error);
  }
}

export default redis;
