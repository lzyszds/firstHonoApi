import { SystemType } from "@/domain/SystemType";
import db from "@/utils/db";



export async function initializeConfig() {
  config = await db.query('SELECT * FROM wb_system_config', [])
}
// 全局配置变量
let config: SystemType[] | null = null;

// 函数重载声明
export function getConfig(key: string): SystemType;
export function getConfig(key?: undefined): SystemType[];
// 实现
export function getConfig(key?: string): SystemType | SystemType[] {
  if (!config) {
    return []
  }
  if (key) {
    const result = config.find((item: SystemType) => item.config_key === key);
    if (!result) {
      throw new Error(`未找到 key 为 ${key} 的配置`);
    }
    return result; // 返回单个 SystemType
  }
  return config; // 返回数组 SystemType[]
}