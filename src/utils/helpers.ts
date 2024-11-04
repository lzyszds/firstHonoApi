import fs from "fs";
import * as https from "https";
import path from "node:path";
import dayjs from "dayjs";
import sharp from "sharp";
import { log } from "node:console";
const rootPath = path.resolve(__dirname, '../../');

/**
 * 通用键值对象接口
 */
interface MapObject {
  [key: string]: any;
}

/**
 * 将对象转换成键值数组
 * @param value 需要转换的对象
 * @returns 转换后的键值数组
 */
const mapGather = (value: MapObject): MapObject[] => {
  return Object.keys(value).map((key: any) => {
    return {
      [key]: value[key],
    };
  }) || [];
};


/**
 * 数据截取函数
 * @param data 原始数据数组
 * @param pages 当前页数
 * @param limit 每页条数
 * @returns 截取后的数据数组和数据总数
 */
const sliceData = <T>(data: T[], pages: number, limit: number): { data: T[], total: number } => {
  // 计算数据总数
  const total = data.length;
  // 计算当前页数
  const page = Number(pages);
  // 计算当前页数的起始位置
  const start = (page - 1) * Number(limit);
  // 计算当前页数的结束位置
  const end = page * Number(limit);
  // 截取当前页数的数据
  data = data.slice(start, end);

  return { data, total };
};

/**
 * 生成在指定范围内不重复的随机数
 * @param min 最小值（包含）
 * @param max 最大值（包含）
 * @param random 上一次的随机数
 * @returns 不重复的随机数
 */
const randomUnique = (min: number, max: number, random: number): number => {
  /* 获取随机数并且不和上一次的随机数一样获取最小值和最大值之间的随机数 */
  let num: number = Math.floor(Math.random() * (max - min + 1) + min);
  // 如果数字与随机数相同，请重试
  if (num == random) {
    return randomUnique(min, max, num);
  }
  // 否则返回数字
  return num;
};

/**
 * 图片代理函数
 * @param url 图片 URL
 * @returns 图片的 base64 编码字符串
 */
const imgProxy = async (url: string): Promise<string> => {
  // 将网络图片转换成 base64
  return new Promise((resolve, reject) => {
    https.get(url, (res: any) => {
      let chunks: any = [];
      res.on('data', (chunk: any) => {
        chunks.push(chunk);
      });
      res.on('end', () => {
        let data: Buffer = Buffer.concat(chunks);
        let base64Img: string = data.toString('base64');
        const img: string = 'data:image/jpeg;base64,' + base64Img;
        resolve(img);
      });
    });
  });
};

/**
 * 处理文件内容，去除重复字符后再写入文件
 */
const processFileContent = (filePath: string): void => {
  try {
    const text = fs.readFileSync(filePath, "utf-8");
    // 去重处理
    const arr = text.split("");
    const newArr = [...new Set(arr)];
    const newStr = newArr.join("");
    // 将文件内容更新
    fs.writeFileSync(filePath, newStr);

    console.log("文件内容去重成功");
    // // 结束进程
    // process.exit(0);
  } catch (error) {
    console.error("文件内容去重失败:", error);
  }
};

/**
 * 将字符串中所有的单引号转换成双引号
 * @param str 需要转换的字符串或字符串数组
 * @returns 转换后的字符串或字符串数组
 */
const replaceSingleQuotes = (str: string | string[]): string | string[] => {
  if (typeof str === 'string') return str.replace(/'/g, '"');
  return str.map((item: string) => {
    return item.replace(/'/g, '"');
  });
};

/**
 * 判断传入的参数是否是英文和数字组成的字符串
 * @param val 需要判断的字符串或字符串数组
 * @returns 如果所有参数都是由英文字母和数字组成的，返回 true；否则返回 false
 */
function toValidEnglishNumber(val: string | string[]): boolean {
  const reg = /^[a-zA-Z0-9]{3,16}$/; // 匹配由英文字母和数字组成，且长度为3到16位的字符串
  if (typeof val === 'string') return reg.test(val);
  return val.every((item: string) => {
    return reg.test(item);
  });
}

/**
 * 获取当前时间的时间戳
 * @returns 当前时间的时间戳
 */
const getCurrentUnixTime = (): number => {
  return dayjs().unix();
};

/**
 * 检查给定的对象是否满足特定条件
 *
 * @param obj - 需要检查的对象
 * @param keys - 需要检查的键的列表
 * @param onlyOneExists - 只需要存在一个的键的列表（可选）
 * @returns 如果对象不满足条件则返回 true，否则返回 false
 */
function checkObj(obj: Record<string, any>, keys: string[], onlyOneExists?: string[]): boolean {
  // 如果对象为空，返回 true
  if (!obj || Object.keys(obj).length === 0) return true;

  // 检查必需的键
  for (const key of keys) {
    if (!(key in obj)) return true; // 如果必需的键不存在，返回 true
    if (isEmpty(obj[key])) return true; // 如果必需的键的值为空，返回 true
  }

  // 如果设置了 onlyOneExists
  if (onlyOneExists && onlyOneExists.length > 0) {
    // 检查 onlyOneExists 中是否至少有一个非空值
    const hasNonEmptyValue = onlyOneExists.some(key => key in obj && !isEmpty(obj[key]));
    return !hasNonEmptyValue; // 如果没有非空值，返回 true
  }

  return false; // 如果所有检查都通过，返回 false
}

/**
 * 检查值是否为空
 * 
 * @param value - 需要检查的值
 * @returns 如果值为空则返回 true，否则返回 false
 */
function isEmpty(value: any): boolean {
  return (
    value === null ||
    value === undefined ||
    value === '' ||
    (Array.isArray(value) && value.length === 0) ||
    (typeof value === 'object' && Object.keys(value).length === 0)
  );
}

//提取出你需要的信息，比如浏览器名称、版本号以及操作系统等
function parseUserAgent(userAgent: any) {
  var browserName = "Unknown";
  var browserVersion = "Unknown";
  var os = "Unknown";
  if (!userAgent) return { browserSystem: "Unknown", browserVersion, deviceSystem: os };
  // 浏览器信息
  if (userAgent.indexOf("Firefox") > -1) {
    browserName = "Firefox";
    browserVersion = userAgent.match(/Firefox\/([\d.]+)/)[1];
  } else if (userAgent.indexOf("Chrome") > -1) {
    browserName = "Chrome";
    browserVersion = userAgent.match(/Chrome\/([\d.]+)/)[1];
  } else if (userAgent.indexOf("Safari") > -1) {
    browserName = "Safari";
    browserVersion = userAgent.match(/Version\/([\d.]+)/)[1];
  } else if (userAgent.indexOf("MSIE") > -1) {
    browserName = "Internet Explorer";
    browserVersion = userAgent.match(/MSIE ([\d.]+)/)[1];
  }

  // 操作系统信息
  if (userAgent.indexOf("Windows NT 10.0") != -1) os = "Windows 10";
  else if (userAgent.indexOf("Windows NT 6.2") != -1) os = "Windows 8";
  else if (userAgent.indexOf("Windows NT 6.1") != -1) os = "Windows 7";
  else if (userAgent.indexOf("Windows NT 6.0") != -1) os = "Windows Vista";
  else if (userAgent.indexOf("Windows NT 5.1") != -1) os = "Windows XP";
  else if (userAgent.indexOf("Macintosh") != -1) os = "MacOS";
  else if (userAgent.indexOf("Linux") != -1) os = "Linux";
  else if (userAgent.indexOf("Android") != -1) os = "Android";
  else if (userAgent.indexOf("like Mac OS X") != -1) {
    os = "iOS";
    // 可以进一步解析iOS的版本
  }

  return { browserSystem: browserName + browserVersion, deviceSystem: os };
}

// 读取 JSON 文件
const readJsonFile = async (filePath: string) => {
  try {
    const data = await fs.readFileSync(filePath, 'utf8');
    return JSON.parse(data);
  } catch (err) {
    console.error('读取失败:', err);
  }
};

// 写入 JSON 文件
const writeJsonFile = async (filePath: string, data: object) => {
  try {
    await fs.writeFileSync(filePath, JSON.stringify(data, null, 2), 'utf8');
  } catch (err) {
    console.error('写入失败:', err);
  }
};

// 追加内容到文件的函数
const appendToFile = (content: string, filePath: string) => {
  try {
    fs.appendFileSync(path.join(rootPath, filePath), content);
  } catch (e) {
    console.error('追加内容到文件失败:', e);
  }
};

/**
 *  上传图片时先将图片压缩至250kb以内 并限制上传文件大小和类型
 *  @param file 上传的文件
 *  @param MAX_FILE_SIZE 上传文件的大小限制 单位 MB
 *  @param ALLOWED_FILE_TYPES 允许上传的文件类型
 *  @param REDUCE_SIZE 压缩后的文件大小限制 单位 MB
*/
const uploadFileLimit = async (
  file: any,
  MAX_FILE_SIZE: number,
  ALLOWED_FILE_TYPES: string[],
  REDUCE_SIZE: number = 0.25,
) => {
  if (file.size === 0) {
    return '未上传文件';
  }

  if (file.size > MAX_FILE_SIZE * 1024 * 1024) {
    return '文件大小超过限制: ' + MAX_FILE_SIZE + ' MB';
  }

  if (!ALLOWED_FILE_TYPES.includes(file.type)) {
    return '文件类型不被允许';
  }

  REDUCE_SIZE = REDUCE_SIZE * 1024; // 转换为 KB

  if (file.size > REDUCE_SIZE) {
    try {
      const buffer = await file.arrayBuffer(); // 转换为 ArrayBuffer
      const nodeBuffer = Buffer.from(buffer);  // 转换为 Node.js 的 Buffer

      // 使用 sharp 压缩图片
      let compressedBuffer = await sharp(nodeBuffer)
        .jpeg({ quality: 100 }) // 调整质量以压缩图片
        .toBuffer();

      // 如果压缩后的文件仍然超过 REDUCE_SIZE，继续调整质量压缩
      if (compressedBuffer.length > REDUCE_SIZE) {
        let quality = 80;
        while (compressedBuffer.length > REDUCE_SIZE && quality > 10) {
          quality -= 10;
          //如果质量小于50，直接返回
          if (quality < 50) {
            return compressedBuffer
          }
          compressedBuffer = await sharp(compressedBuffer)
            .jpeg({ quality })
            .toBuffer();
        }
      }

      return compressedBuffer;
    } catch (error) {
      console.error('压缩图片时发生错误:', error);
      return '压缩图片失败';
    }
  }

  return file;
};


//睡眠
const sleep = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

// 处理通配符参数 给参数添加 % %
const handleParamsWildcard = (obj: any) => {
  const params = []
  let whereValue = ''
  for (let key in obj) {
    if (obj[key]) {
      obj[key] = `%${obj[key]}%`
      whereValue += (!whereValue ? 'where ' : 'and ') + `${key} like ? `
      params.push(obj[key])
    }
  }
  return { whereValue, params }
}


export {
  mapGather,  // 将对象转换成键值数组
  sliceData,  // 数据截取函数
  randomUnique,   // 生成在指定范围内不重复的随机数
  imgProxy,   // 图片代理函数
  processFileContent,   // 处理文件内容，去除重复字符后再写入文件
  replaceSingleQuotes,    // 将字符串中所有的单引号转换成双引号
  toValidEnglishNumber,   // 判断传入的参数是否是英文和数字组成的字符串
  getCurrentUnixTime, // 获取当前时间的时间戳
  checkObj,    // 检查对象是否包含指定的键，或者只有一个存在的键，如果存在的键的值为空，则返回真
  parseUserAgent, // 提取出你需要的信息，比如浏览器名称、版本号以及操作系统等
  readJsonFile,   // 读取 JSON 文件
  writeJsonFile,  // 写入 JSON 文件
  appendToFile,   // 追加内容到文件的函数
  uploadFileLimit,  // 上传文件大小和类型限制
  sleep,  // 睡眠
  handleParamsWildcard, // 处理通配符参数
};
