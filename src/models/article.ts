//文章接口
import db from "../utils/db";

class ArticleMapper {

  //获取文章列表总数
  public async getArticleListTotal(search: string): Promise<number> {
    let sql: string = `
            SELECT COUNT(*) as total 
            FROM wb_articles 
            WHERE title LIKE ? OR  partial_content LIKE ? 
        `;
    const total = await db.query(sql, [search, search, search]);
    return total[0].total;
  }

  //获取文章列表
  public async findAll(search: string = "%%", pages: number | string, limit: number | string): Promise<any> {
    pages = Number(pages);
    limit = Number(limit);
    const sql = `
      SELECT 
        a.*, 
        wb_users.uname, 
        wb_users.head_img, 
        GROUP_CONCAT(DISTINCT wb_articlestype.name) AS tags,  -- 使用 DISTINCT 来避免重复标签
        (
          SELECT COUNT(*) 
          FROM wb_comments 
          WHERE wb_comments.article_id = a.aid
        ) AS comment_count  -- 子查询来统计每篇文章的评论数
      FROM 
        wb_articles AS a
      INNER JOIN 
        wb_users ON a.uid = wb_users.uid
      LEFT JOIN 
        wb_articles_types ON a.aid = wb_articles_types.aid
      LEFT JOIN 
        wb_articlestype ON wb_articles_types.type_id = wb_articlestype.type_id
      WHERE 
        a.title LIKE ? OR a.partial_content LIKE ?
      GROUP BY 
        a.aid
      ORDER BY 
        a.aid DESC
      LIMIT ?, ?
    `;
    const offset = (pages - 1) * limit;

    try {
      // 使用参数数组直接传递分页和搜索参数
      const result = await db.query(sql, [`%${search}%`, `%${search}%`, offset, limit]);
      return result; // 返回查询结果
    } catch (e) {
      throw e; // 直接抛出异常
    }
  }



  //获取文章信息
  public async findArticleInfo(id: string): Promise<any> {
    try {

      const updateSql = `UPDATE wb_articles
        SET access_count = access_count + 1
        WHERE aid = ?`
      await db.query(updateSql, [id])

      const sql = `
        SELECT 
          a.aid, a.create_date, a.title, a.content, a.main, a.modified_date, 
          a.cover_img, a.partial_content,  
          u.uname, u.head_img, u.signature,
          GROUP_CONCAT(at.name) AS tags
        FROM wb_articles AS a
        JOIN wb_users AS u ON a.uid = u.uid
        LEFT JOIN wb_articles_types AS art ON a.aid = art.aid
        LEFT JOIN wb_articlestype AS at ON art.type_id = at.type_id
        WHERE a.aid = ?
        GROUP BY a.aid;
      `;

      const [result] = await db.query(sql, [id, id]);


      if (!result) {
        return null;
      }

      result.tags = result.tags ? result.tags.split(',') : [];

      return result;
    } catch (error) {
      console.error('Error in findArticleInfo:', error);
      throw error;
    }
  }

  // //更新文章访问量
  // public async updateArticleAccessCount(id: string) {
  //     let sql: string = `
  //         UPDATE wb_articles
  //         SET access_count = access_count + 1
  //         WHERE aid = ?
  //     `;
  //     return await db.query(sql, [id]);
  // }

  //获取文章类型列表
  public async findArticleTypeAll() {
    let sql: string = `
            SELECT *
            FROM wb_articlestype 
            WHERE whether_use = 1
        `;
    return await db.query(sql, []);
  }

  //根据文章类型获取文章类型id
  public async getArticleTypeByName(name: string) {
    let sql: string = `
            SELECT type_id
            FROM wb_articlestype 
            WHERE name = ?
        `;
    return await db.query(sql, [name]);
  }

  //将文章id和文章类型id插入到文章类型表
  public async addArticleTypeByAid(type_id: string, aid: string) {
    let sql: string = `
            INSERT INTO wb_articles_types (type_id, aid) 
            VALUES (?, ?)
        `;
    return await db.query(sql, [type_id, aid]);
  }

  //新增文章
  public async addArticle(params: any) {
    const { title, content, cover_img, main, partial_content, uid, create_date } = params;
    let sql: string = `
            INSERT INTO wb_articles (title, content, cover_img, main, partial_content, uid, create_date) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
        `;
    return await db.query(sql, [title, content, cover_img, main, partial_content, uid, create_date]);
  }

  //修改文章
  public async updateArticle(params: any) {
    let sqlSetFieldArr: string[] = []
    let sqlQueryArr: string[] = []
    Object.keys(params).forEach((key: string) => {
      if (params[key] == undefined || !params[key] || key === 'tags') {
        delete params[key]
      } else {
        //修改了什么就更新什么
        sqlSetFieldArr.push(`${key} = ?`)
        sqlQueryArr.push(params[key])
      }
    })
    let sqlSetField: string = sqlSetFieldArr.join(',')
    //修改时间
    sqlSetField += ', modified_date = NOW()'
    let sql: string = `
            UPDATE wb_articles
            SET ${sqlSetField}
            WHERE aid = ?
        `;
    sqlQueryArr.push(params.aid)
    return await db.query(sql, sqlQueryArr);
  }

  //新增文章类型
  public async addArticleType(name: string) {
    let sql: string = `
            INSERT INTO wb_articlestype (name, whether_use) 
            VALUES (?, ?)
        `;
    let result
    try {
      result = await db.query(sql, [name, 1]);
    } catch (e) {
      result = e
    }
    return result;
  }

  //删除文章类型
  public async deleteArticleType(type_id: string) {
    let sql: string = `
            DELETE FROM wb_articlestype
            WHERE type_id = ?
        `;
    return await db.query(sql, [type_id]);
  }


  //删除文章
  public async deleteArticle(id: string) {
    let sql: string = `
            DELETE FROM wb_articles
            WHERE aid = ?
        `;
    return await db.query(sql, [id]);
  }


}


export default new ArticleMapper();
