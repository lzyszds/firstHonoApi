import db from "../utils/db";
import { CommentType } from "../domain/CommentType";

class CommentMapper {
  //获取文章评论
  public async getArticleComment(id: string) {
    let sql: string = `
            SELECT *
            FROM wb_comments 
            WHERE article_id = ?
        `;
    return await db.query(sql, [id]);
  }

  //获取所有评论
  public async getAllComment(search: string, pages: string, limit: string) {
    const offset: number = (Number(pages) - 1) * Number(limit);

    let sql: string = `
            SELECT *
            FROM wb_comments
            WHERE content LIKE ? OR user_name LIKE ? OR email LIKE ? OR user_ip LiKE ?
            ORDER BY comment_id DESC LIMIT ?, ?
        `;
    return await db.query(sql, [search, search, search, search, offset, Number(limit)]);
  }

  // 获取所有评论总数
  public async getAllCommentTotal(search: string) {
    let sql: string = `
            SELECT COUNT(*) as total
            FROM wb_comments
            WHERE content LIKE ? OR user_name LIKE ? OR email LIKE ? OR user_ip LIKE ?
        `;
    const result = await db.query(sql, [search, search, search, search])
    return result[0].total;
  }
  //新增评论
  public async addComment(params: any) {
    let {
      content,
      aid,
      replyId,
      groundId,
      email,
      name,
      userIp,
      img,
      nowDate,
      deviceSystem,
      browserSystem,
      replyPeople
    } = params;

    if (replyId == 0) replyPeople = ""
    let sql: string = `
            INSERT INTO wb_comments (content, article_id, reply_id, ground_id , email, user_name, user_ip, head_img, create_date,deviceSystem,browserSystem,reply_people)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)
        `;
    return await db.query(sql, [content, aid, replyId, groundId, email, name, userIp, img, nowDate, deviceSystem, browserSystem, replyPeople]);
  }

  //新增文章评论数
  public async addArticleCommentCount(id: string) {
    let sql: string = `
            UPDATE wb_articles
            SET comments_count = comments_count + 1
            WHERE aid = ?
        `;
    return await db.query(sql, [id]);
  }

  //删除评论
  public async deleteComment(ids: string) {
    let sql: string = `
            DELETE FROM wb_comments
            WHERE comment_id in (?) or reply_id in (?)
        `;
    return await db.query(sql, [ids, ids]);
  }

  //获取最新评论
  public async getNewComment(limit: number): Promise<CommentType[]> {
    let sql: string = `
            SELECT *
            FROM wb_comments 
            ORDER BY create_date DESC
            LIMIT 0, ?
        `;
    return await db.query(sql, [limit]);
  }

}

export default new CommentMapper();
