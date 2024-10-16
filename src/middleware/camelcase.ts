import { Context } from "hono"


/* 驼峰转换 */
// Helper function to convert snake_case to camelCase
function toCamelCase(str: string): string {
  return str.replace(/([-_][a-z])/g, (group) =>
    group.toUpperCase().replace('-', '').replace('_', '')
  )
}

// Recursive function to convert all keys in an object to camelCase
function convertToCamelCase(obj: any): any {
  if (Array.isArray(obj)) {
    return obj.map(convertToCamelCase)
  } else if (obj !== null && typeof obj === 'object') {
    return Object.keys(obj).reduce((result, key) => {
      result[toCamelCase(key)] = convertToCamelCase(obj[key])
      return result
    }, {} as Record<string, any>)
  }
  return obj
}



export default async (c: Context, next: () => Promise<void>) => {
  await next();

  const response = c.res;

  // 检查响应头，确保只处理 JSON 类型的响应
  const contentType = response.headers.get('Content-Type');
  if (contentType && contentType.includes('application/json')) {
    try {
      // 只有当响应是 JSON 时才进行处理
      const body = await response.json();
      const camelCasedBody = convertToCamelCase(body);
      c.res = new Response(JSON.stringify(camelCasedBody), response);
    } catch (error) {
      console.error('Error processing JSON response:', error);
    }
  }

}
