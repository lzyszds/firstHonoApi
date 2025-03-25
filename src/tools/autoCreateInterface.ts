import db from "@/utils/db";
import handleAiFox from "@/utils/handleAiFox";




//当前文件用于自动提取接口文档 直接在终端运行即可

// apiExtractor.js
const fs = require("fs").promises;
const path = require("path");

// 定义要扫描的目录（假设你的接口文件都在某个文件夹下）
const apiDir = path.join(__dirname, "../routes/api");

// 存储所有提取的 API 信息
const apiSummary: any = {
  get: {},
  post: {},
  // 可以根据需要添加其他方法，如 put, delete 等
};

// 正则表达式用于匹配路由定义和注释
const routeRegex = {
  // 匹配单行注释（如 // 获取用户列表）
  comment: /\/\/\s*(.+)$/,
  // 匹配路由定义（如 "/getUserList": userController.getUserList）
  route: /"([^"]+)":\s*([^,\n]+)/,
};


// 提取 API 的函数
async function extractApisFromFile(filePath: any) {
  try {
    const content = await fs.readFile(filePath, "utf-8");
    const lines = content.split("\n");

    let currentMethod = null; // 当前处理的 HTTP 方法
    let lastComment = null; // 上一次匹配到的注释

    for (const line of lines) {
      // 去除首尾空白
      const trimmedLine = line.trim();


      // 检查是否是方法定义（如 get: { 或 post: {）
      if (trimmedLine.match(/get:\s*{/)) {
        currentMethod = "get";
        continue;
      } else if (trimmedLine.match(/post:\s*{/)) {
        currentMethod = "post";
        continue;
      }

      // 提取注释
      const commentMatch = trimmedLine.match(routeRegex.comment);

      if (commentMatch) {
        lastComment = commentMatch[1];
        continue;
      }

      // 提取路由
      const routeMatch = trimmedLine.match(routeRegex.route);

      if (routeMatch && currentMethod) {
        const [_, routePath, controller] = routeMatch;

        const belong = controller.trim().split('.')[0].replace('Controller', '') // 获取接口所属模块
        const key = "/" + belong + routePath;

        apiSummary[currentMethod][key] = {
          controller: controller.trim(),
          description: lastComment || "无描述",
        };
        // 将结果存放进数据库
        // db.query('INSERT INTO wb_interface (interface_method,interface_belong, interface_name, interface_desc) VALUES (?,?,?,?)', [currentMethod, belong, key, lastComment || "无描述"])
        lastComment = null; // 重置注释，避免影响下一行
      }
    }
  } catch (err) {
    console.error(`读取文件 ${filePath} 失败:`, err);
  }
}

// 扫描目录并处理所有 JS 文件
export async function scanApiFiles() {
  try {
    const files = await fs.readdir(apiDir);

    const jsFiles = files.filter((file: any) => file.endsWith(".ts"));

    for (const file of jsFiles) {
      const filePath = path.join(apiDir, file);

      await extractApisFromFile(filePath);
    }

    console.log("API 提取完成:", apiSummary);


  } catch (err) {
    console.error("扫描目录失败:", err);
  }
}



const belongs: any = {
  "article": {
    "value": "article",
    "label": "文章接口",
    "desc": "这是与文章相关的接口，通常用于博客、新闻或内容管理系统。"
  },
  "comment": {
    "value": "comment",
    "label": "评论接口",
    "desc": "这是与评论相关的接口，通常与文章或其他内容相关联。"
  },
  "openAI": {
    "value": "openAI",
    "label": "Ai接口",
    "desc": "包括文本生成、问答、翻译、摘要等功能。"
  },
  "permission": {
    "value": "permission",
    "label": "权限接口",
    "desc": "这是与权限管理相关的接口，通常用于控制用户访问权限。包括角色管理、权限分配、权限检查等。"
  },
  "plantask": {
    "value": "plantask",
    "label": "任务接口",
    "desc": "指计划任务或任务管理，包括创建任务、查看任务列表、更新任务状态、删除任务等"
  },
  "system": {
    "value": "system",
    "label": "系统接口",
    "desc": "这是与系统管理相关的接口，通常用于系统设置或管理员功能，包括系统配置、日志查看、系统状态监控等。"
  },
  "toolkit": {
    "value": "toolkit",
    "label": "工具接口",
    "desc": "提供一些实用工具或辅助功能的接口"
  },
  "user": {
    "value": "user",
    "label": "用户接口",
    "desc": "用户相关的接口，通常用于用户管理功能"
  }
}

for (const key in belongs) {
  const item = belongs[key]
  db.query('INSERT INTO wb_interface_belong (ib_value,ib_label,ib_desc) VALUES (?,?,?)', [item.value, item.label, item.desc])
}