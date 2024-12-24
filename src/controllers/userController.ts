// src/controllers/userController.ts
import {Context} from "hono";
import userService from "../services/userService";
import ApiConfig, {DataTotal} from "../domain/ApiCongfigType";
import {GetUserListParams, User, UserRole} from "@/domain/User";
import fs from "fs";
import path from "path";
import {checkObj, randomUnique, uploadFileLimit} from "@/utils/helpers";
import {getCookie, setCookie} from "hono/cookie";
import {comparePasswords, hashPassword} from "@/utils/passwordUtils";
import dayjs from "dayjs";
import {decodeToken, generateToken} from "@/utils/authUtils";
import {nanoid} from "nanoid";
import {getIpAddress} from "@/utils/getIpAddress";
import ToolkotMapper from "@/models/toolkit";
import {PictureBedType} from "@/domain/PictureBedType";


class UserController {
  //获取用户列表
  async getUserList(c: Context) {
    const {name = '', username = '', power = '', signature = '', pages = "1", limit = "10"} = c.req.query();
    const search: GetUserListParams = {username, uname: name, power, signature}
    const total = await userService.getUserListTotal(search);
    const userList = await userService.getUserList(search, pages, limit);
    const apiConfig: ApiConfig<DataTotal<UserRole>> = new ApiConfig(c);
    const result = apiConfig.success({total, data: userList});
    return c.json(result);
  }

  //根据id获取用户信息
  async getUserInfo(c: Context) {
    const {id} = c.req.query();
    const userInfo = await userService.findById(id);
    const apiConfig: ApiConfig<UserRole> = new ApiConfig<UserRole>(c);
    const result = apiConfig.success(userInfo[0]);
    return c.json(result);
  }

  //根据token获取用户信息
  async getUserInfoToken(c: Context) {
    const token = getCookie(c, 'lzytkn')
    const userInfo = decodeToken(token!);
    const apiConfig: ApiConfig<UserRole> = new ApiConfig<UserRole>(c);
    // @ts-ignore
    const result = apiConfig.success(userInfo);
    return c.json(result);
  }

  //获取随机头像
  async getRandHeadImg(c: Context) {
    // 从会话中获取上次保存的随机数，默认为1
    let randomName = getCookie(c, "randomName") || 1;
    // 获取文件夹 public/img/updateImg 中的所有文件
    const files = fs.readdirSync(
      path.join(__dirname, "../../static/img/updateImg")
    );
    // 随机获取一张图片，但是要确保和上一次的随机数不一样
    let random = randomUnique(1, files.length - 1, Number(randomName));
    const img = files[random];
    // 记录当前返回的图片的随机数，以便下次不重复
    setCookie(c, "randomName", random.toString(), {maxAge: 60 * 60});
    // 返回一个成功的 ApiConfig 对象，包含图片的路径
    const apiConfig = new ApiConfig<string>(c);
    const result = apiConfig.success("/img/updateImg/" + img);
    return c.json(result);
  }

  /* 获取所有头像 */
  async getAllHeadImg(c: Context) {
    const images = await ToolkotMapper.getImageInfo({
      page: 1,
      limit: 7,
      type: 'head'
    })

    // 返回一个成功的 ApiConfig 对象，包含图片的路径
    const apiConfig: ApiConfig<PictureBedType[]> = new ApiConfig<PictureBedType[]>(c);
    const result = apiConfig.success(images);
    return c.json(result);
  }

  //登陆
  async login(c: Context) {

    const {username, password, remember} = await c.req.json()
    // 创建一个 ApiConfig 对象
    const apiConfig = new ApiConfig<string>(c);

    // 定义统一的响应处理函数
    const respond = (data: any) => c.json(data);
    let result = "" as any;
    //检查用户名和密码是否为空
    if (!username || !password) {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      return respond(apiConfig.fail("用户名或密码不能为空"));
    }

    // 调用 userMapper.login 方法获取用户信息 通过账号获取加密后的密码
    const user: User = await userService.checkUser(username);
    if (!user) {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      return respond(apiConfig.fail("该账号不存在"));
    }

    if (user.whether_use != 1) {
      return respond(apiConfig.fail("该账号已被禁用"));
    }
    // 比较密码是否正确
    const isMatch: boolean = await comparePasswords(password, user.password);

    // 如果用户信息存在，说明登录成功
    if (isMatch) {

      //生成token 有效期 2天 如果勾选记住我 有效期为7天
      const activation_key = generateToken(user, remember ? Math.floor(7 * 24) + 'h' : '48h');
      const ip = await getIpAddress(c);
      //修改用户最后登录时间
      const last_login_date = dayjs().format("YYYY-MM-DD HH:mm:ss");
      await userService.updateUser({uid: user.uid, last_login_date, last_login_ip: ip});

      // 返回一个成功的 ApiConfig 对象，包含提示信息
      result = apiConfig.success(activation_key)
    } else {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      result = apiConfig.fail("用户名或密码错误")
    }
    return respond(result);
  }


  //新增用户账号
  async addUser(c: Context) {
    const params = await c.req.json();

    //检查 用户名、密码、权限、创建时间、最后登录时间、个性签名、头像、是否启用 是否为空
    if (checkObj(params, ["uname", "username", "password", "head_img"])) {
      // 创建一个 ApiConfig 对象
      const apiConfig = new ApiConfig<string>(c);
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      return c.json(apiConfig.fail("请检查内容是否填写完整"));
    }
    let result: any;

    //获取当前请求来源的ip
    params.create_ip =
      c.req.header("x-forwarded-for") ||
      c.req.header("cf-connecting-ip") ||
      c.req.header("x-real-ip") ||
      "::1";
    //初次创建用户，权限默认为 1 ，是否启用默认为 1 ，密码默认为 123456 密码加密
    params.password = await hashPassword(params.password || "123456");
    params.power = params.power || "1";
    params.whether_use = params.whether_use || "1";
    // 获取当前时间
    let create_date = dayjs().format('YYYY/MM/DD HH:mm:ss');
    // 创建一个 ApiConfig 对象
    const apiConfig = new ApiConfig<string>(c);
    try {
      // 调用 userMapper.addUser 方法获取用户信息
      const addInfo = await userService.addUser(Object.assign(params, {create_date,}));
      if (addInfo.affectedRows >= 0) {
        // 返回一个成功的 ApiConfig 对象，包含提示信息
        result = apiConfig.success("添加用户成功");
      } else {
        // 返回一个失败的 ApiConfig 对象，包含提示信息
        result = apiConfig.fail("添加用户失败");
      }
    } catch (e: any) {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      result = apiConfig.fail("添加用户失败 " + e);
    }
    return c.json(result);
  }

  //修改用户信息
  async updateUser(c: Context) {
    const params = await c.req.json();
    let result: any;
    // 创建一个 ApiConfig 对象
    const apiConfig = new ApiConfig<string>(c);
    //检查参数是否包含 id
    if (
      checkObj(
        params,
        ["uid"],
        ["uname", "password", "power", "whether_use", "signature", "head_img"]
      )
    ) {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      result = apiConfig.fail("请传入要修改的用户id");
    } else {
      try {
        if (params.password) {
          params.password = await hashPassword(params.password)
        } else {
          delete params.password
        }
        // 调用 userMapper.updateUser 方法获取用户信息
        const updateIfOk = await userService.updateUser(params);
        if (updateIfOk.affectedRows >= 0) {
          // 返回一个成功的 ApiConfig 对象，包含提示信息
          result = apiConfig.success("修改用户信息成功");
        } else {
          // 返回一个失败的 ApiConfig 对象，包含提示信息
          result = apiConfig.fail("修改用户信息失败");
        }
      } catch (e: any) {
        // 返回一个失败的 ApiConfig 对象，包含提示信息
        result = apiConfig.fail("修改用户信息失败->:" + e);
      }
    }
    return c.json(result);
  }

  //删除用户
  async deleteUser(c: Context) {
    const params = await c.req.json();
    let result: any;
    // 创建一个 ApiConfig 对象
    const apiConfig = new ApiConfig<string>(c);
    //检查参数是否包含 id
    if (checkObj(params, ["uid"])) {
      // 返回一个失败的 ApiConfig 对象，包含提示信息
      result = apiConfig.fail("请传入要删除的用户id");
    } else {
      try {
        if (typeof params.uid !== "string") {
          params.uid = params.uid + ''
        }
        // 调用 userMapper.deleteUser 方法获取用户信息
        const deleteIfOk = await userService.deleteUser(params.uid);
        if (deleteIfOk.affectedRows > 0) {
          // 返回一个成功的 ApiConfig 对象，包含提示信息
          result = apiConfig.success("删除用户成功");
        } else {
          // 返回一个失败的 ApiConfig 对象，包含提示信息
          result = apiConfig.fail("删除用户失败");
        }
      } catch (e: any) {
        // 返回一个失败的 ApiConfig 对象，包含提示信息
        result = apiConfig.fail("删除用户失败->:" + e);
      }
    }
    return c.json(result);
  }

  //上传用户头像
  async uploadHeadImg(c: Context) {

    let result: any;
    const formData = await c.req.parseBody();

    // 假设文件字段名是 'file'
    let file = formData['upload-image'] as File;
    let buffer = await file.arrayBuffer();


    // 允许上传的文件类型
    const ALLOWED_FILE_TYPES = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/bmp', 'image/webp', 'image/svg+xml'];
    result = await uploadFileLimit(file, 10, ALLOWED_FILE_TYPES)
    if (typeof result === 'string') {
      return c.json(result);
    } else {
      buffer = result;
    }

    // 使用 nanoid 生成唯一文件名
    const filename = nanoid() + path.extname(file.name) + '.webp';
    const articleImagesPath = `/static/img/articleImages/`
    const uploadPath = path.join(__dirname, '../..', articleImagesPath + filename);


    //@ts-ignore
    fs.writeFileSync(uploadPath, Buffer.from(buffer));
    result = {message: '文件上传成功', filename: articleImagesPath + filename}

    return c.json(result);
  }
}

export default new UserController();
