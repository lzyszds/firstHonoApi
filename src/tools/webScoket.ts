// 在线用户集合
import {decodeToken} from "@/utils/authUtils";
import UserModel from "@/models/user";
import {convertToCamelCase} from "@/middleware/camelcase";

export const onlineUsers = new Set<string>();

// 用户 ID 到 WebSocket 连接的映射
export const connections = new Map<string, WebSocket>();

// 广播在线用户列表
export async function broadcastOnlineUsers() {
    const userListFindAll = Array.from(onlineUsers).map(async res => {
        return await UserModel.findById(res);
    });
    let userList: any[] = [];
    for (const element of userListFindAll) {
        userList.push((await element)[0]);
    }

    connections.forEach((ws) => {
        if (ws.readyState === 1) {
            // Bun 使用数字表示状态, 1 代表 OPEN
            ws.send(JSON.stringify({type: "onlineUsers", data: convertToCamelCase(userList)}));
        }
    });
}

// 处理 WebSocket 升级
export function handleWebSocketUpgrade(
    req: Request,
    server: any
) {

    try {
        server.upgrade(req, {data: {userId: null}});
        return undefined;
    } catch (e) {
        return new Response("升级到WebSocket失败", {status: 500});
    }

}


export const websocket = {
    open: (ws: any,) => { // Type as any if a specific WebSocket type is not available
        // Check for ws.data and ws.data.userId if needed
        if (ws.data && ws.data.userId) {
            // console.log(`User ${ws.data.userId} connected (on open)`);
        }
    },
    message: async (ws: any, message: string | Uint8Array) => {
        try {
            const decodedMessage = typeof message === 'string' ? message : new TextDecoder().decode(message);
            const data = JSON.parse(decodedMessage);

            if (data.type === '在线' && data.userId && data.token) {
                // ... Verify token (using your preferred method) ...
                const user = decodeToken(data.token)
                if (data.userId != user.uid) {
                    return ws.close(1008, 'token 错误');
                }

                // Set userId on ws.data after successful verification
                ws.data.userId = data.userId;

                onlineUsers.add(data.userId);
                connections.set(data.userId, ws);
                // console.log(`User ${data.userId} connected (on message)`);
                broadcastOnlineUsers();
            } else {
                // Handle other message types...
                // You may need to check ws.data.userId here as well,
                // depending on your application logic.
                console.log('Received unknown message:', data);
            }
        } catch (error) {
            console.error('Error handling WebSocket message:', error);
            ws.send(JSON.stringify({type: 'error', message: 'Invalid message format'}));
        }
    },
    close: (ws: any) => {
        // console.log('WebSocket closed');
        // Check for ws.data and ws.data.userId if needed
        if (ws.data && ws.data.userId) {
            onlineUsers.delete(ws.data.userId);
            connections.delete(ws.data.userId);
            // console.log(`User ${ws.data.userId} disconnected`);
            broadcastOnlineUsers();
        }
    },
}

