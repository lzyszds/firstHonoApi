// src/models/user.ts
import db from '../utils/db';
import type { User, UserAny, UserRole } from "../domain/User";
import JoinSQL from '../utils/JoinSQL';
import { OkPacket } from 'mysql';

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
      "last_login_ip", "activation_key"
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
  async getUserListTotal(search: string): Promise<number> {
    // 实现获取记录总数逻辑...
    let sql: string = `
            SELECT COUNT(*) as total 
            FROM wb_users 
            WHERE uname LIKE ? OR username LIKE ? OR power LIKE ? OR signature LiKE ?
        `;
    const total = await db.query(sql, [search, search, search, search]);
    return total[0].total;
  }

  // 获取符合搜索条件的记录,获取分页的用户列表
  async getUserList(search: string, pages: string, limit: string): Promise<UserRole[]> {
    const offset: number = (Number(pages) - 1) * Number(limit);
    let sql: string = `
            SELECT *
            FROM wb_users 
            WHERE uname LIKE ? OR username LIKE ? OR power LIKE ? OR signature LiKE ? 
            ORDER BY uid LIMIT ?, ?
        `;
    return await db.query(sql, [search, search, search, search, offset, Number(limit)]);
  }

  // 根据token获取用户信息
  public async getUserInfoToken(token: string): Promise<UserRole> {
    let sql: string = `
            SELECT uid, uname, username, power, create_date, last_login_date, head_img, whether_use, signature,create_ip,last_login_ip
            FROM wb_users 
            WHERE activation_key = ?
        `;
    return await db.query(sql, [token]);
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
      "signature", "head_img", "whether_use", "activation_key", "create_ip"];
    const queryArr = joinSQL.INSERT(user, sqlArr, "wb_users");
    return await db.query(queryArr[0], queryArr[1]);
  }

  // 删除用户
  public async deleteUser(id: string): Promise<OkPacket> {
    let sql: string = `
            DELETE FROM wb_users 
            WHERE uid = ?
        `;
    return await db.query(sql, [id]);
  }
}

export default new UserModel();
