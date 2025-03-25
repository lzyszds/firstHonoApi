import ApiConfig from "@/domain/ApiCongfigType";
import db from "../utils/db";
import { PermissionType, WbInterfaceBelong } from "@/domain/PermissionType";
import { OkPacket } from "mysql";

class PermissionMapper {

  // 获取所有接口列表
  public async findAll(): Promise<PermissionType[]> {
    const sql: string = `SELECT *
                         FROM wb_interface`
    return await db.query(sql, []);
  }

  // 修改接口权限
  public async update(params: any): Promise<OkPacket> {
    const sql: string = `UPDATE wb_interface
                         SET interface_permissions = ?
                         WHERE interface_id = ?`
    return await db.query(sql, [params.interface_permissions, params.interface_id]);
  }

  // 获取接口所属信息
  public async findBelongs(): Promise<WbInterfaceBelong> {
    const sql: string = `SELECT *
                         FROM wb_interface_belong`
    return await db.query(sql, []);
  }
}

export default new PermissionMapper();
