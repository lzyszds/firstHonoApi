// 请求头（只保留必要的头部信息）
import system from "@/models/system";

const headers = {
    "accept": "application/json, text/plain, */*",
    "x-csrf-token": "csrf-1731945127614",  // 如果需要 csrf-token，保留这一行
    "x-requested-with": "XMLHttpRequest",  // 标识请求是通过 AJAX 发起的
    "Cookie": `userid=24166440; omaccesstoken=picture_bed_token; omtoken=picture_bed_token; logintype=4`
};

export const uploadImage = async (file: any, filename: string) => {
    // 图床上传接口地址
    const url = "https://om.qq.com/marticle/ommixin/image/archscaleupload";

    // 创建 FormData 对象
    const formData = new FormData();

    // 将文件和文件名添加到 FormData 中
    formData.append('file', file);  // 添加文件
    formData.append('Filename', filename);  // 添加文件名，使用文件对象的 name 属性


    //从数据库中拿到图库token
    const configList = await system.getSystemConfig("6")
    const token = configList[0].config_value
    headers.Cookie = `userid=24166440; omaccesstoken=${token}; omtoken=${token}; logintype=4`


    // 使用 fetch 发送请求
    try {
        const response = await fetch(url, {
            method: "POST",
            headers: headers,
            body: formData,
            credentials: "include",  // 使用 include 保证携带 cookie
            mode: "cors",  // 设置跨域请求
        });
        // 处理响应数据
        const data = await response.json();
        return data;

    } catch (error) {
        console.error("上传失败:", error);
    }
};

export const deleteImage = async (resource_id: string) => {
    // 图床删除接口地址
    const url = "https://om.qq.com/marticle/ommixin/image/delete?resourceId=" + resource_id;

    // 使用 fetch 发送请求
    try {
        const response = await fetch(url, {
            method: "GET",
            headers: headers,
            body: JSON.stringify({resource_id}),
            credentials: "include",  // 使用 include 保证携带 cookie
            mode: "cors",  // 设置跨域请求
        });

        // 处理响应数据
        const data = await response.json();
        return data;

    } catch (error) {
        console.error("删除失败:", error);
    }
}
