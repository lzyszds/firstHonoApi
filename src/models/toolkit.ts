import { AdminHomeType, AdminHomeTypeSql } from "@/domain/AdminHomeType";
import db from "../utils/db";
import { PictureBedCreate, PictureBedImageListParams, PictureBedType } from "@/domain/PictureBedType";

class ToolkitMapper {

  //根据ip地区获取具体的城市编码
  public async getCityCodeByIp(city: string): Promise<{ adcode: string }> {
    const sql: string = `SELECT adcode
                         FROM wb_map_adcode_citycode
                         WHERE city = ? `
    const result = await db.query(sql, [city]);
    return result[0];
  }

  //获取后台首页数据
  public async getAdminHomeData(): Promise<AdminHomeType> {
    const sqlObjeck: AdminHomeTypeSql = {
      articleCount: `SELECT COUNT(*) as total
                     FROM wb_articles`,
      articleTypeCount: `SELECT COUNT(*) as total
                         FROM wb_articlestype`,
      commentCount: `SELECT COUNT(*) as total
                     FROM wb_comments`,
      articleAccess: `SELECT SUM(access_count) as total
                      FROM wb_articles`,
      userCount: `SELECT COUNT(*) as total
                  FROM wb_users `,
      hotArticle: `SELECT a.aid,
                          a.create_date,
                          a.title,
                          a.cover_img,
                          a.access_count,
                          wb_users.uname,
                          wb_users.head_img
                   FROM wb_articles AS a
                            JOIN wb_users ON a.uid = wb_users.uid
                   ORDER BY access_count DESC LIMIT 0, 6`
    }

    let result: AdminHomeType = {} as AdminHomeType;
    for (let key in sqlObjeck) {
      result[key] = await db.query(sqlObjeck[key], [])
    }

    return result;
  }

  //获取图床中所有图片的信息
  public async getImageInfo(params: PictureBedImageListParams): Promise<PictureBedType[]> {
    const sql: string = `SELECT *
                         FROM wb_picture_bed
                         WHERE derive_from LIKE ? limit ?, ?`
    return await db.query(sql, [params.type, (Number(params.page) - 1) * Number(params.limit), params.limit]);
  }

  //新增图片信息
  public async saveImageInfo(params: PictureBedCreate): Promise<number> {
    const sql: string = `
        INSERT
        INTO wb_picture_bed(url, name, other_sizes, derive_from, derive_from_id)
        VALUES (?, ?, ?, ?, ?);
    `
    return await db.query(sql, [params.url, params.name, params.other_sizes, params.derive_from, params.derive_from_id]);
  }

  //删除图片
  public async deleteImage(id: number): Promise<any> {
    const querySql: string = `
        SELECT * FROM wb_picture_bed
        WHERE id = ? `
    const result = await db.query(querySql, [id])
    const sql: string = `
        DELETE FROM wb_picture_bed
        WHERE id = ? `

    return [result[0], await db.query(sql, [id])];
  }

}

export default new ToolkitMapper();
