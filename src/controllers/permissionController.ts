//文章接口
import PermissionService from "../services/PermissionService";
import ApiConfig from "../domain/ApiCongfigType";
import { Context } from "hono";
class PermissionController {
  // 获取所有接口列表
  async findAll(c: Context) {
    return c.json(await PermissionService.findAll(c));
  }

  // 修改接口权限
  async update(c: Context) {
    return c.json(await PermissionService.update(c));
  }

  // 获取接口所属信息
  async findBelongs(c: Context) {
    return c.json(await PermissionService.findBelongs(c));
  }

}

export default new PermissionController();
