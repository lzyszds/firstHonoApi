/*
 * @Description: 全局配置信息
 */
import path from 'path';


export default {
    port: 2024, // 启动端口
    staticDir: path.join(__dirname, 'static'), // 静态文件目录
    uploadDir: path.join(__dirname, path.resolve('static/')), // 上传文件路径
    weatherKey: "78182b9b39355dc0ae4ce91dae7f0bbf",
    //根据当前文件名字的后缀名字来判断当前是开发环境还是生产环境 开发环境为.ts 生产环境为.js
    env: path.extname(__filename) === '.ts' ? 'development' : 'production',

    cors: {
        origin: ['http://localhost:1026', 'http://127.0.0.1:1026', 'http://101.201.171.168:1026', 'http://101.201.171.168:1027'],
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
        database: 'lzy_admin'
    },
    //拦截器白名单
    interceptorWhiteList: [
        '/users/login',
        '/users/getRandHeadImg',
        '/users/getAllHeadImg',
        '/article/getRandArticleImg',
        '/article/getArticleList',
        '/comment/getArticleComment',
        '/article/getArticleInfo',
        '/article/getArticleDetail',
        '/comment/getArticleTypeList',
        '/comment/addComment',
        '/comment/getNewComment',
        '/comment/getCommentAvatar',
        '/toolkit/ipConfig',
        '/toolkit/getGithubInfo',
        '/toolkit/getPoetry',
        '/toolkit/getWeather',
        '/system/getSystemConfig',
        '/system/getFooterInfo',
        '/system/getLazyLoadImage',
        '/openAI/getAifox',
    ],
    //github api密钥 配置
    githubUserConfig: {
        token1: 'github_pat',
        token2: '_11APYO7PI0nRTBPl7vEuvM',
        token3: '_RGJBdfX7iuKZn0TrK8CL4W7It12ukIQVVk3qlXqOAVINB3NRCVLKNxxq2Rh',
        name: 'lzyszds',
    },

    //ai服务配置
    aiServiceConfig: {
        url: 'https://api.chatanywhere.tech/v1/chat/completions/', //ai服务地址
        sleepTime: 10 //流式传输发送的时间间隔
    }
}


