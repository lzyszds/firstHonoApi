//文章接口
import db from "@/utils/db";
import { handleParamsWildcard } from "@/utils/helpers";
import type { Articles, GetArticleListParams } from "@/domain/Articles";

class ArticleMapper {

    //获取文章列表总数
    public async getArticleListTotal(search: GetArticleListParams): Promise<number> {
        try {
            const { whereValue, params } = handleParamsWildcard(search);

            const sql = `
                SELECT COUNT(DISTINCT a.aid) as total
                FROM wb_articles a
                    ${whereValue}
            `;
            const [result] = await db.query<[{ total: number }]>(sql, params);
            return result.total;
        } catch (error) {
            throw error;
        }
    }

    //获取文章列表
    public async findAll(search: GetArticleListParams, page: number | string, limit: number | string): Promise<Articles[]> {
        try {
            const pageNum = Number(page);
            const limitNum = Number(limit);
            const offset = (pageNum - 1) * limitNum;

            const { whereValue, params } = handleParamsWildcard(search);
            const whereClause = whereValue.replace('aid', 'a.aid');

            const sql = `
                SELECT a.aid,
                       a.title,
                       a.main,
                       a.uid,
                       a.whether_use,
                       a.partial_content,
                       a.create_date,
                       a.access_count,
                       a.cover_img,
                       a.modified_date, 
                       a.content,
                       u.uname, 
                       u.head_img,
                       GROUP_CONCAT(DISTINCT at.name) AS tags,
                       COUNT(wc.article_id) AS comment_count
                FROM wb_articles a
                        INNER JOIN wb_users u ON a.uid = u.uid
                        LEFT JOIN wb_articles_types art ON a.aid = art.aid
                        LEFT JOIN wb_articlestype at ON art.type_id = at.type_id
                        LEFT JOIN wb_comments wc ON a.aid = wc.article_id
                ${whereClause}
                GROUP BY a.aid, u.uname, u.head_img
                ORDER BY a.aid DESC
                LIMIT ?, ?;
            `;
            return await db.query<Articles[]>(sql, [...params, offset, limitNum]);
        } catch (error) {
            throw error;
        }
    }

    public async findArticleList(search: GetArticleListParams, page: number | string, limit: number | string): Promise<Articles[]> {
        try {
            const pageNum = Number(page);
            const limitNum = Number(limit);
            const offset = (pageNum - 1) * limitNum;

            // 处理通配符参数 给参数添加 % %
            const { whereValue, params } = handleParamsWildcard(search);
            const whereClause = whereValue.replace('aid', 'a.aid');

            const sql = `
            SELECT
                a.aid,
                a.title,
                a.main,
                a.uid,
                a.whether_use,
                a.partial_content,
                a.create_date,
                a.access_count,
                a.cover_img,
                a.modified_date,
                u.uname,
                u.head_img,
                GROUP_CONCAT(DISTINCT at.name) AS tags,
                COALESCE(MAX(c.comment_count), 0) AS comment_count
            FROM
                wb_articles a
                INNER JOIN wb_users u ON a.uid = u.uid
                LEFT JOIN wb_articles_types art ON a.aid = art.aid
                LEFT JOIN wb_articlestype at ON art.type_id = at.type_id
                LEFT JOIN (
                    SELECT
                        article_id,
                        COUNT(*) as comment_count
                    FROM
                     wb_comments 
                    GROUP BY
                        article_id
                ) c ON a.aid = c.article_id
            ${whereClause ? whereClause + 'and a.whether_use = 1' : 'WHERE a.whether_use = 1'} 
            GROUP BY
                a.aid, a.title, a.content, a.uid, a.whether_use, u.uname, u.head_img
            ORDER BY
                a.aid DESC
            LIMIT ?, ?
            `;
            return await db.query<Articles[]>(sql, [...params, offset, limitNum]);
        } catch (error) {
            throw error;
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
                SELECT a.aid,
                       a.create_date,
                       a.title,
                       a.content,
                       a.main,
                       a.modified_date,
                       a.cover_img,
                       a.partial_content,
                       u.uname,
                       u.head_img,
                       u.signature,
                       GROUP_CONCAT(at.name) AS tags
                FROM wb_articles AS a
                         JOIN wb_users AS u ON a.uid = u.uid
                         LEFT JOIN wb_articles_types AS art ON a.aid = art.aid
                         LEFT JOIN wb_articlestype AS at
                ON art.type_id = at.type_id
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
        try {
            const { title, content, cover_img, main, partial_content, uid, create_date, access_count } = params;
            let sql: string = `
            INSERT INTO wb_articles (title, content, cover_img, main, partial_content, uid, create_date, access_count)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `;
            return await db.query(sql, [title, content, cover_img, main, partial_content, uid, create_date, access_count]);
        } catch (e) {
            console.error('Error in addArticle:', e);
        }
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
            DELETE
            FROM wb_articlestype
            WHERE type_id = ?
        `;
        return await db.query(sql, [type_id]);
    }


    //删除文章
    public async deleteArticle(id: string) {
        let sql: string = `
            DELETE
            FROM wb_articles
            WHERE aid = ?
        `;
        return await db.query(sql, [id]);
    }

    //禁用文章
    public async disableArticle(id: string) {
        let sql: string = `
            UPDATE wb_articles
            SET whether_use = 1 - whether_use
            WHERE aid = ?
        `;
        return await db.query(sql, [id]);
    }


}


export default new ArticleMapper();
