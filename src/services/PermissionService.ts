//接口权限管理接口
import { Component, PermissionType, WbInterfaceBelong } from '@/domain/PermissionType';
import ApiConfig from '../domain/ApiCongfigType';
import permissionModel from '../models/permission'
import { Context } from 'hono';

class PermissionService {
  public async findAll(c: Context) {
    const data: PermissionType[] = await permissionModel.findAll();
    const apiConfig: ApiConfig<PermissionType[]> = new ApiConfig(c);
    return apiConfig.success(data);
  }

  public async findByName(c: Context) {
    
    const { name } = c.req.query()
    console.log(name);
    
    const data: PermissionType[] = await permissionModel.findByName(name);
    const apiConfig: ApiConfig<PermissionType[]> = new ApiConfig(c);
    return apiConfig.success(data);
  }

  public async update(c: Context) {
    const params = await c.req.json()

    const result = await permissionModel.update(params);
    const apiConfig: ApiConfig<string> = new ApiConfig(c);
    if (result.affectedRows === 0) return apiConfig.fail('修改失败')

    // 获取最新的接口权限列表
    const permission = await this.findAll(c)

    // 数据存入redis
    await c.redis.setex('permission', 600, JSON.stringify(permission.data));

    return apiConfig.success("修改成功");
  }


  // 获取接口所属信息
  public async findBelongs(c: Context) {
    const data = await permissionModel.findBelongs();
    const apiConfig: ApiConfig<WbInterfaceBelong> = new ApiConfig(c);
    return apiConfig.success(data);
  }


  // 获取组件权限
  public async findComponent(c: Context) {
    const data = await permissionModel.findComponent();
    const apiConfig: ApiConfig<Component[]> = new ApiConfig(c);
    return apiConfig.success(data);
  }

}

export default new PermissionService()
