/**
 * 接口表的数据结构
 */
interface PermissionType {
  /**
   * 接口ID，主键，自增
   */
  interface_id: number;

  /**
   * 接口种类 例如 'admin' 或 'user'，不可为空
   */
  interface_belong: string;


  /**
   * 接口名称，唯一
   */
  interface_name: string;

  /**
   * 允许的级别，例如 'admin,user'，可为空
   */
  interface_permissions: number

  /**
   * 接口描述，可为空
   */
  interface_desc?: string | null;

  /**
   * 接口请求方法，例如 'POST' 或 'GET'
   */
  interface_method: string;

  /**
   * 创建时间，默认当前时间
   */
  created_at: Date | string;

  /**
   * 更新时间，可为空，更新时自动设为当前时间
   */
  updated_at?: Date | string | null;
}

// 可选：如果需要区分创建和更新时的类型（部分字段可选）
interface PermissionCreate {
  interface_name: string;
  interface_permissions?: string | null;
  interface_desc?: string | null;
  interface_method: string;
}


// 定义 wb_interface_belong 表的 TypeScript 接口
interface WbInterfaceBelong {
  ib_id: number;           // 主键，自增ID
  ib_value: string;        // 唯一值，最大长度100
  ib_label: string;        // 标签，最大长度100
  ib_desc: string;         // 描述
  created_at: string;      // 创建时间，格式如 "2025-03-24 10:00:00"
  updated_at: string | null; // 更新时间，可能为 null
}

// 可选：如果需要创建或更新时的接口（部分字段可能是可选的）
interface WbInterfaceBelongCreateOrUpdate {
  ib_value: string;        // 必填
  ib_label: string;        // 必填
  ib_desc: string;         // 必填
  created_at?: string;     // 可选，创建时通常由数据库自动生成
  updated_at?: string | null; // 可选，更新时由数据库自动生成
}




export { PermissionType, PermissionCreate, WbInterfaceBelong, WbInterfaceBelongCreateOrUpdate };

