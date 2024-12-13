
// 在线用户集合
export const onlineUsers = new Set<string>();

// 用户 ID 到 WebSocket 连接的映射
export const connections = new Map<string, WebSocket>();

// 广播在线用户列表
export function broadcastOnlineUsers() {
  const userList = Array.from(onlineUsers);
  connections.forEach((ws) => {
    if (ws.readyState === 1) {
      // Bun 使用数字表示状态, 1 代表 OPEN
      ws.send(JSON.stringify({ type: "onlineUsers", data: userList }));
    }
  });
}

// 处理 WebSocket 升级
export function handleWebSocketUpgrade(
  req: Request,
  server: any
) {
  // 从请求头中获取 JWT
  const token = req.headers.get("Sec-WebSocket-Protocol");

  let userId = null;
  // if (token) {
  //     try {
  //         const secret = 'YOUR_JWT_SECRET';
  //         const payload = await verify(token, secret);
  //         userId = payload.sub; // 获取用户 ID
  //     } catch (error) {
  //         console.error('JWT verification failed:', error);
  //         // 可以选择关闭连接或发送错误消息
  //     }
  // }

  const success = server.upgrade(req, {
    data: {
      userId: null, // 初始时 userId 未设置
    },
  });
  console.log(success);

  if (success) {
    return undefined;
  }

  return new Response("Failed to upgrade to WebSocket", { status: 500 });
}

