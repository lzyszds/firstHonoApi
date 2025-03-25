import { PermissionType } from "@/domain/PermissionType";
import db from "@/utils/db";

export async function initPermissionConfig() {
  config = await db.query('SELECT * FROM wb_interface', [])
}
// 全局配置变量
let config: PermissionType[] | null = null;

export function getConfig(): PermissionType[] {
  if (!config) {
    return []
  }
  return config; // 返回数组 PermissionType[]
}