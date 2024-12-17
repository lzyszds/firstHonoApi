import { Context } from "hono";

export const getIpAddress = async (c: Context) => {
  // 1. 尝试从 'x-forwarded-for' 获取
  const forwardedFor = c.req.header('x-forwarded-for');


  if (forwardedFor) {
    const ips = forwardedFor.split(',');
    const clientIp = ips[0].trim();
    return clientIp
  }

  // 2. 对于本地开发环境，尝试通过第三方服务获取公网 IP
  try {
    const response = await fetch('https://ipinfo.io/ip');
    const data = await response.text()
    if (data) {
      return data
    }
  } catch (error) {
    console.error('Error fetching IP from third-party service:', error);
  }

  // 如果所有方法都失败，返回错误信息
  return '无法获取 IP 地址'
}