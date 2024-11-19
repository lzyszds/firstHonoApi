import {AdminHomeType} from "../domain/AdminHomeType";
import db from "../utils/db";
import {SystemConfigType} from "../domain/ToolkitType";
import {OkPacket} from "mysql";
import {Footer} from "../domain/FooterType";
import {SystemType} from "@/domain/SystemType";

class SystemMapper {
  //从数据库获取系统设置配置
  public async getSystemConfig(ids: string): Promise<SystemConfigType[]> {
    const sqlAfter: string = `WHERE config_id IN (${ids})`
    let sql: string = `SELECT *
                       FROM wb_system_config ` + (ids == 'admin' ? '' : sqlAfter) + `ORDER BY config_id `;
    return await db.query(sql, []);
  }

  //新增系统设置
  public async addSystemConfig(params: SystemType): Promise<OkPacket> {
    const sql: string = `INSERT INTO wb_system_config (config_key, config_value, config_desc)
                         VALUES (?, ?, ?)`
    return await db.query(sql, [params.config_key, params.config_value, params.config_desc]);
  }

  //更新系统设置
  public async updateSystemConfig(params: SystemType): Promise<OkPacket> {
    const sqlParams = ['config_value', 'config_key', 'config_desc']
    const sql: string = `UPDATE wb_system_config
                         SET ${sqlParams.map((item => item + "=?")).join(',')}
                         WHERE config_id = ?`
    return await db.query(sql, [...sqlParams.map(item => params[item]), params.config_id]);
  }

  //获取系统公告
  public async getNotification(title: string = '', way_type: string = ''): Promise<AdminHomeType[]> {
    const sql: string = `SELECT *
                         FROM wb_system_notifications
                         WHERE title = ?
                            or way_type = ?
                         ORDER BY create_time DESC`
    return await db.query(sql, [title, way_type]);
  }

  //新增系统公告
  public async addFooterInfo(params: Footer): Promise<OkPacket> {
    const sql: string = `INSERT INTO wb_footer (footer_type, footer_content, footer_url, footer_order)
                         VALUES (?, ?, ?, ?)`
    return await db.query(sql, [params.footer_type, params.footer_content, params.footer_url, params.footer_order]);
  }

  //新增二级页脚信息
  public async addFooterLink(params: WbFooterLink): Promise<OkPacket> {
    const sql: string = `INSERT INTO wb_footer_links (category_id, name, url, sort_order, status)
                         VALUES (?, ?, ?, ?, ?) `
    return await db.query(sql, [params.category_id, params.name, params.url, params.sort_order, params.status]);
  }

  //获取页脚信息
  public async getFooterInfo(): Promise<WbFooterResult[]> {
    //查询所有启用的分类和链接（按排序顺序）
    const sql: string = `
        SELECT c.*,
               (SELECT JSON_ARRAYAGG(
                               JSON_OBJECT(
                                       'id', l.id,
                                       'name', l.name,
                                       'url', l.url,
                                       'sort_order', l.sort_order,
                                       'status', l.status
                               ))
                FROM wb_footer_links l
                WHERE l.category_id = c.id) as children
        FROM wb_footer_categories c
        ORDER BY c.sort_order;`
    return await db.query(sql, []);
  }

  //更新页脚一级分类信息
  public async updateFooterCategory(data: WbFooterCategory): Promise<OkPacket> {
    const sql: string = `UPDATE wb_footer_categories
                         SET name       = ?,
                             sort_order = ?,
                             status     = ?
                         WHERE id = ?`
    return await db.query(sql, [data.name, data.sort_order, data.status, data.id]);
  }

  //更新页脚二级分类信息
  public async updateFooterLink(data: WbFooterLink): Promise<OkPacket> {
    const sql: string = `UPDATE wb_footer_links
                         SET name       = ?,
                             url        = ?,
                             sort_order = ?,
                             status     = ?
                         WHERE id = ?`
    return await db.query(sql, [data.name, data.url, data.sort_order, data.status, data.id]);
  }

  //更新页脚信息
  public async updateFooterInfo(data: Footer[]): Promise<OkPacket> {

    for (let i = 0; i < data.length; i++) {
      const sql: string = `UPDATE wb_footer
                           SET footer_content = ?
                           WHERE footer_id = ?`
      await db.query(sql, [data[i].footer_content, data[i].footer_id]);

    }
    const sql: string = `UPDATE wb_footer
                         SET footer_content = ?
                         WHERE footer_id = ?`
    return await db.query(sql, []);
  }

}

export default new SystemMapper();
