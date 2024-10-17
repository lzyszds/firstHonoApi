import os from 'os';

// 获取本地 IP 地址
export const getLocalIp = () => {
  const networkInterfaces = os.networkInterfaces();
  for (const key in networkInterfaces) {
    const iface = networkInterfaces[key];
    if (iface) {
      for (const alias of iface) {
        if (alias.family === 'IPv4' && !alias.internal) {
          return alias.address; // 返回本地 IP
        }
      }
    }
  }
  return 'localhost'; // 如果找不到则默认返回 localhost
};