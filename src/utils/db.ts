/*
 * @Description: 数据库连接
 * @Author: hai-27
 * @Date: 2020-02-07 16:51:56
 * @LastEditors: hai-27
 * @LastEditTime: 2020-02-27 13:20:11
 */
import mysql, {MysqlError, PoolConnection} from "mysql";
import Config from "../../config";

//一些数据库错误的中文提示
export const dbErrorMessage: any = {
  'ER_DUP_ENTRY': '数据库中已存在该记录',
  'ER_NO_REFERENCED_ROW': '外键约束检查失败',
  'ER_NO_REFERENCED_ROW_2': '外键约束检查失败',
  'ER_ROW_IS_REFERENCED': '外键约束检查失败',
  'ER_ROW_IS_REFERENCED_2': '外键约束检查失败',
  'ER_DUP_ENTRY_WITH_KEY_NAME': '数据库中已存在该记录',
  'ER_DUP_ENTRY_WITH_UNIQUE_KEY': '数据库中已存在该记录',
}

let pool: mysql.Pool = mysql.createPool(Config.dbConfig);

// interface Connection {
//   query(sql: string, params: any, callback: (error: any, results: any, fields: any) => void): void;
//
//   release(): void;
// }

interface Database {
  query(sql: string, params: any): Promise<any>;
}


/**
 * fieldCount: 表示返回的字段数。
 * affectedRows: 表示受查询影响的行数。
 * insertId: 如果查询包含插入操作，并且插入的表具有自增主键，insertId 将包含插入的最后一行的自增ID。
 * serverStatus: 表示 MySQL 服务器的状态。
 * warningCount: 表示服务器返回的警告数量。
 * */
const db: Database = {
  query: function (sql: string, params: any): Promise<any> {
    // 处理一下params 如果里面有值为NULL 的转换为`%%`
    if (sql.indexOf("SELECT") !== -1) {
      // console.log(`lzy  sql:`, sql);
      for (let key in params) {
        if (params[key] === '' || params[key] === null) {
          params[key] = '%%';
        }
      }
    }
    return new Promise((resolve, reject) => {
      // 取出链接
      try {
        pool.getConnection(function (err: MysqlError, connection: PoolConnection) {
          // 处理错误
          ErrorHandle(err, reject);
          connection.query(sql, params, (error: MysqlError | null, results: any, _fields: any) => {

            // 释放连接
            connection.release();
            // 处理错误
            ErrorHandle(error, reject);
            resolve(results);
            //输出完整的sql查询语句
            // console.log(`lzy  sql:`, connection.format(sql, params));
          });

        });
      } catch (e: any) {
        ErrorHandle(e, reject);
      }
    });
  },
}

function ErrorHandle(err: MysqlError | null, reject: Function) {
  // 截取错误信息
  if (err) {
    console.error(err);
    reject(dbErrorMessage[err.code]);
  }
}


// 导出对象
export default db;
