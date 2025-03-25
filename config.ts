/*
 * @Description: 全局配置信息
 */
import path from 'path';


export default {
  port: 2024, // 启动端口
  staticDir: path.join(__dirname, 'static'), // 静态文件目录
  uploadDir: path.join(__dirname, path.resolve('static/')), // 上传文件路径
  weatherKey: "78182b9b39355dc0ae4ce91dae7f0bbf",
  //图床代理地址
  pictureBedProxy: "/pictureBedImage/",
  //根据当前文件名字的后缀名字来判断当前是开发环境还是生产环境 开发环境为.ts 生产环境为.js
  env: path.extname(__filename) === '.ts' ? 'development' : 'production',

  // 跨域设置
  cors: {
    origin: [
      'http://localhost',
      'http://localhost:1026',
      'http://127.0.0.1:1026',
      'https://admin.lzyszds.cn',
      'https://jing.lzyszds.cn',
      'https://lzyszds.cn',
      'https://www.lzyszds.cn',
      'http://101.201.171.168:1026',
      'http://101.201.171.168:1027'
    ],
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true,
  },

  // 数据库连接设置
  dbConfig: {
    connectionLimit: 10,
    host: '101.201.171.168',
    port: 3306,
    user: 'lzy_admin',
    password: 'a395878870',
    database: 'lzy_admin',
    charset: 'utf8mb4'
  },

  //拦截器白名单
  interceptorWhiteList: [
    '/users/login',  //登录
    '/users/getRandHeadImg', //获取随机头像
    '/users/getAllHeadImg', //获取所有头像
    '/article/getRandArticleImg', //获取随机文章封面
    '/article/getArticleListForWeb', //获取文章列表
    '/comment/getArticleComment', //获取文章评论
    '/article/getArticleInfo',  //获取文章信息
    '/article/getArticleDetail',  //获取文章详情
    '/comment/getArticleTypeList',   //获取文章分类
    '/comment/addComment',    //新增评论
    '/comment/getNewComment',     //获取最新评论
    '/comment/getCommentAvatar',    //获取评论头像
    '/toolkit/ipConfig',  //获取ip地址
    '/toolkit/getGithubInfo', //获取github信息
    '/toolkit/getPoetry', //获取诗词
    '/toolkit/getWeather',  //获取天气
    '/system/getSystemConfig',  //获取系统配置
    '/system/getFooterInfo',  //获取底部信息
    '/system/getLazyLoadImage', //获取懒加载图片
    '/system/uploadImageToPictureBed',  //上传图片
    '/openAI/getAifox', //获取aifox
    '/openAI/getSiliconflowiAi' //获取siliconflowiAi
  ],

  //ai服务配置
  aiServiceConfig: {
    url: 'https://api.chatanywhere.tech/v1/chat/completions/', //ai服务地址
    sleepTime: 10 //流式传输发送的时间间隔
  },

  permission: [
    {
      title: "公开访问",
      icon: "hugeicons:view",
      description: "无需登录即可访问",
      sumValue: 0,
      roles: [],
    },
    {
      title: "普通用户和管理员",
      icon: "hugeicons:user-id-verification",
      description: "需要登录权限即可访问",
      sumValue: 0,
      roles: [0, 1],
    },
    {
      title: "管理员",
      icon: "hugeicons:ai-security-01",
      description: "仅管理员可访问",
      sumValue: 0,
      roles: [0],
    },
    {
      title: "特殊权限",
      icon: "hugeicons:complaint",
      description: "特殊权限",
      sumValue: 0,
      roles: [2],
    },
  ]
}


