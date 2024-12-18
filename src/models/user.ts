// src/models/user.ts
import db from '@/utils/db';
import type {GetUserListParams, User, UserAny, UserRole} from "@/domain/User";
import JoinSQL from '@/utils/JoinSQL';
import {OkPacket} from 'mysql';
import {handleParamsWildcard} from '@/utils/helpers';

const joinSQL = new JoinSQL();

class UserModel {

  // 根据id查找用户
  async findById(id: string): Promise<UserRole> {
    const selectResult = [
      "uid", "uname",
      "username", "power",
      "create_date", "last_login_date",
      "head_img", "whether_use",
      "signature", "create_ip",
      "last_login_ip",
    ]
    // 实现查找用户逻辑...
    let sql: string = `
        SELECT ${selectResult}
        FROM wb_users
        WHERE uid = ?
    `;
    return await db.query(sql, [id]);
  }

  // 获取符合搜索条件的记录总数
  async getUserListTotal(search: GetUserListParams): Promise<number> {
    const {whereValue, params} = handleParamsWildcard(search)
    // 实现获取记录总数逻辑...
    let sql: string = `
        SELECT COUNT(*) as total
        FROM wb_users ${whereValue}
    `;
    const total = await db.query(sql, params);
    return total[0].total;
  }

  // 获取符合搜索条件的记录,获取分页的用户列表
  async getUserList(search: GetUserListParams, pages: string, limit: string): Promise<UserRole[]> {
    const offset: number = (Number(pages) - 1) * Number(limit);
    const {whereValue, params} = handleParamsWildcard(search)
    let sql: string = `
        SELECT *
        FROM wb_users ${whereValue}
        ORDER BY uid LIMIT ?, ?
    `;

    return await db.query(sql, [
      ...params,
      offset,
      Number(limit)
    ]);
  }

  // 检查用户名获取密码
  public async checkUser(username: string): Promise<User> {
    let sql: string = `
        SELECT *
        FROM wb_users
        WHERE username = ?
    `;
    return (await db.query(sql, [username]))[0];
  }

  // 修改用户信息(根据uid，可以指定修改某一属性)
  public async updateUser(user: UserAny): Promise<any> {
    //函数式处理sql语句
    const query = joinSQL.UPDATE(user, "wb_users", "uid");

    return await db.query(query[0], query[1]);
  }

  // 新增用户
  public async addUser(user: UserAny): Promise<OkPacket> {
    //函数式处理sql语句
    const sqlArr: string[] = ["uname", "username", "password", "power", "create_date",
      "signature", "head_img", "whether_use", "create_ip"];
    const queryArr = joinSQL.INSERT(user, sqlArr, "wb_users");
    return await db.query(queryArr[0], queryArr[1]);
  }

  // 删除用户
  public async deleteUser(id: string): Promise<OkPacket> {
    let sql: string = `DELETE
                       FROM wb_users
                       WHERE uid in (?) `;
    return await db.query(sql, [id.split(",")]);
  }
}

export default new UserModel();
