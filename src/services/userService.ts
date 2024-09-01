// src/services/userService.ts
import UserModel from '../models/user'
import { User, UserRole, UserAny } from '../domain/User'
import { OkPacket } from 'mysql';

const userModel = new UserModel()

export class UserService {

  // 根据id查找用户
  async findById(id: string): Promise<UserRole> {
    return await userModel.findById(id);
  }


  //  获取符合搜索条件的记录总数
  async getUserListTotal(search: string): Promise<number> {
    return await userModel.getUserListTotal(search);
  }

  // 获取符合搜索
  async getUserList(search: string, pages: string, limit: string): Promise<UserRole[]> {
    return await userModel.getUserList(search, pages, limit);
  }

  // 根据token获取用户信息
  async getUserInfoToken(token: string): Promise<UserRole> {
    return await userModel.getUserInfoToken(token);
  }

  //检查用户名获取密码
  async checkUser(username: string): Promise<User> {
    return await userModel.checkUser(username);
  }

  // 修改用户信息(根据uid，可以指定修改某一属性)
  async updateUser(user: UserAny): Promise<OkPacket> {
    return await userModel.updateUser(user);
  }

  // 新增用户
  async addUser(user: UserAny): Promise<OkPacket> {
    return await userModel.addUser(user);
  }

  // 删除用户
  async deleteUser(id: string): Promise<OkPacket> {
    return await userModel.deleteUser(id);
  }
}
