export const uploadImage = async (files: any, filename: string) => {
  // 图床上传接口地址
  const url = "https://om.qq.com/marticle/ommixin/image/archscaleupload";

  // 请求头（只保留必要的头部信息）
  const headers = {
    "accept": "application/json, text/plain, */*",
    "x-csrf-token": "csrf-1731945127614",  // 如果需要 csrf-token，保留这一行
    "x-requested-with": "XMLHttpRequest",  // 标识请求是通过 AJAX 发起的
    "Cookie": "userid=24166440; omaccesstoken=0009ed555cb46fe67bb7956eb1706feef0d31ba5bac9cc2d81b903eb788030547a10d9ea443a7099fa308c9b0c1dd77a21b3ebf8e77614c3a77d54b991507a557amb; omtoken=0009ed555cb46fe67bb7956eb1706feef0d31ba5bac9cc2d81b903eb788030547a10d9ea443a7099fa308c9b0c1dd77a21b3ebf8e77614c3a77d54b991507a557amb; logintype=4"
  };

  // 创建 FormData 对象
  const formData = new FormData();

  // 将文件和文件名添加到 FormData 中
  formData.append('file', files['upload-image']);  // 添加文件
  formData.append('Filename', filename);  // 添加文件名，使用文件对象的 name 属性


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
