export interface SystemType {
  [key: string]: any;
  config_id?: number;
  config_key: string;
  config_value: string;
  config_desc: string;
  config_type: string;
}


// 定义日志接口
export interface SystemLog {
  trace_id: string
  log_type: number
  user_id?: number
  username?: string
  user_ip: string
  module: string
  action: string
  method: string
  url: string
  request_method: string
  request_params?: string
  request_body?: string
  response_body?: string
  execute_time: number
  status: number
  error_message?: string
}