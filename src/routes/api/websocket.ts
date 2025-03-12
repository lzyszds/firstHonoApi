import {Hono} from "hono";

interface Routes {
    [key: string]: { [key: string]: (c: any) => any };

    get: { [key: string]: (c: any) => any };
}

const router = new Hono();

router.get("/onlineUsers", (c: any) => {
    // 获取所有在线用户 websocket
    if (c.req.header("Upgrade") !== "websocket") {
        return c.text("不是WebSocket请求", 400);
    }

    const server = c.server; // Get the Bun server instance
    try {
        server.upgrade(c.req.raw, {data: {userId: null}});
        return undefined;
    } catch (e) {
        return new Response("Failed to upgrade to WebSocket", {status: 500});
    }
})

router.get("/latestComments", (c: any) => {
    if (c.req.header("Upgrade") !== "websocket") {
        return c.text("不是WebSocket请求", 400);
    }

    const server = c.server; // Get the Bun server instance
    try {
        server.upgrade(c.req.raw, {data: []});
        return undefined;
    } catch (e) {
        return new Response("Failed to upgrade to WebSocket", {status: 500});
    }
})


export default router
