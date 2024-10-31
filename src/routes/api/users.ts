import { Hono } from "hono";
import userController from "../../controllers/userController";
interface Routes {
  [key: string]: { [key: string]: (c: any) => any };
  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}
const router = new Hono();

const routes: Routes = {
  get: {
    // 获取用户列表
    "/getUserList": userController.getUserList,
    // 根据id获取用户信息
    "/getUserInfo": userController.getUserInfo,
    // 根据token获取用户信息
    "/getUserInfoToken": userController.getUserInfoToken,
    // 获取随机头像
    "/getRandHeadImg": userController.getRandHeadImg,
    // 获取所有头像
    "/getAllHeadImg": userController.getAllHeadImg,
  },
  post: {
    // 登陆
    "/login": userController.login,
    //开始记录用户在线时间
    "/startOnlineTime": userController.startOnlineTime,
    //新增用户账号
    "/addUser": userController.addUser,
    //修改用户信息
    "/updateUser": userController.updateUser,
    //删除用户
    "/deleteUser": userController.deleteUser,
    //上传头像
    "/uploadHeadImg": userController.uploadHeadImg,
  },
};

for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}

export default router;
