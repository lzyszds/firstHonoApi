
// 在线用户集合
export const onlineUsers = new Set<string>();

// 用户 ID 到 WebSocket 连接的映射
export const connections = new Map<string, WebSocket>();

// 广播在线用户列表
export function broadcastOnlineUsers() {
  const userList = Array.from(onlineUsers);
  console.log("Online Users:", userList);
  
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

  const success = server.upgrade(req, {
    data: {
      token: '',
      type: "离线",
      userId: ''
    },
    websocket: {
      open: (ws: WebSocket) => {
        console.log("WebSocket opened");
      }
    }
  });

  if (success) {
    return undefined;
  }

  return new Response("Failed to upgrade to WebSocket", { status: 500 });
}


