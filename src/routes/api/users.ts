import { Hono } from 'hono';
import UserController from '../../controllers/userController';

const router = new Hono();

const userController = new UserController();


// 获取用户列表
router.get('/getUserList', userController.getUserList);

// 根据id获取用户信息
router.get('/getUserInfo', userController.getUserInfo);

// 根据token获取用户信息
router.get('/getUserInfoToken', userController.getUserInfoToken);

// 获取随机头像
router.get('/getRandHeadImg', userController.getRandHeadImg);

// 登陆
router.post('/login', userController.login);

//开始记录用户在线时间
router.post('/startOnlineTime', userController.startOnlineTime);

//新增用户账号
router.post('/addUser', userController.addUser);

//修改用户信息
router.post('/updateUser', userController.updateUser);

//删除用户
router.post('/deleteUser', userController.deleteUser);

//上传头像
router.post('/uploadHeadImg', userController.uploadHeadImg);

export { router as usersRouter };
