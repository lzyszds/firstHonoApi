/*
 * @Description: 数据库连接
 * @Author: hai-27
 * @Date: 2020-02-07 16:51:56
 * @LastEditors: hai-27
 * @LastEditTime: 2020-02-27 13:20:11
 */
import mysql, {MysqlError, PoolConnection} from "mysql";
import Config from "../../config";
import logger from "@/middleware/logger";

//一些数据库错误的中文提示
export const dbErrorMessage: any = {
    'ER_DUP_ENTRY': '数据库中已存在该记录',
    'ER_NO_REFERENCED_ROW': '外键约束检查失败，找不到引用的父表记录',
    'ER_NO_REFERENCED_ROW_2': '外键约束检查失败，找不到引用的父表记录',
    'ER_ROW_IS_REFERENCED': '外键约束检查失败，有子表记录引用',
    'ER_ROW_IS_REFERENCED_2': '外键约束检查失败，有子表记录引用',
    'ER_DUP_ENTRY_WITH_KEY_NAME': '数据库中已存在该记录，违反唯一索引',
    'ER_DUP_ENTRY_WITH_UNIQUE_KEY': '数据库中已存在该记录，违反唯一索引',
    'ER_BAD_FIELD_ERROR': '字段不存在',
    'ER_NO_SUCH_TABLE': '表不存在',
    'ER_PARSE_ERROR': 'SQL语法错误',
    'ER_DATA_TOO_LONG': '数据过长，超过字段长度限制',
    'ER_WRONG_VALUE_COUNT_ON_ROW': '插入/更新的值数量与列的数量不匹配',
    'ER_NON_UNIQ_ERROR': '违反非唯一索引',
    'ER_CANT_DROP_FIELD_OR_KEY': '无法删除字段或键，可能被约束引用',
    'ER_ACCESS_DENIED_ERROR': '访问被拒绝，权限不足',
    'ER_CON_COUNT_ERROR': '连接数过多',
    'ER_DBACCESS_DENIED_ERROR': '数据库访问被拒绝，请检查数据库或用户是否存在',
    'ER_TABLEACCESS_DENIED_ERROR': '表访问被拒绝，请检查是否有权限',
    'ER_UNKNOWN_ERROR': '未知的数据库错误',
    'ER_LOCK_WAIT_TIMEOUT': '锁等待超时',
    'ER_DEADLOCK': '死锁',
    'ER_NOT_SUPPORTED_YET': 'MySQL版本不支持此操作',
    'ER_INVALID_CHARACTER_STRING': '字符串包含无效字符',
    'ER_TRUNCATED_WRONG_VALUE': '数据被截断，数据类型不匹配',
    'ER_DIVISION_BY_ZERO': '除数为零',
    'ER_ILLEGAL_VALUE_FOR_TYPE': '字段的数据类型与提供的值类型不匹配',
    'ER_UPDATE_WITHOUT_KEY': '更新操作缺少主键或唯一键',
    'ER_NO_DEFAULT_FOR_FIELD': '字段缺少默认值',
    'ER_INVALID_GROUP_BY': '无效的 GROUP BY 子句',
    'ER_MIX_OF_GROUP_FUNC_AND_FIELDS': 'GROUP BY 子句中使用了非聚合字段',
    'ER_QUERY_INTERRUPTED': '查询被中断',
    'ER_OUT_OF_RESOURCES': '数据库资源不足',
    'ER_FILE_EXISTS': '文件已存在'
};

let pool: mysql.Pool = mysql.createPool(Config.dbConfig);

// interface Connection {
//   query(sql: string, params: any, callback: (error: any, results: any, fields: any) => void): void;
//
//   release(): void;
// }

interface Database {
    query<T = any>(sql: string, params: any): Promise<T>;
}


/**
 * fieldCount: 表示返回的字段数。
 * affectedRows: 表示受查询影响的行数。
 * insertId: 如果查询包含插入操作，并且插入的表具有自增主键，insertId 将包含插入的最后一行的自增ID。
 * serverStatus: 表示 MySQL 服务器的状态。
 * warningCount: 表示服务器返回的警告数量。
 * */
const db: Database = {
    query: function <T = any>(sql: string, params: any): Promise<T> {
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
        reject("数据库错误：" + (dbErrorMessage[err.code] || err.message));
    }
}


// 导出对象
export default db;
