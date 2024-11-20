// tasks表类型
export interface Task {
  id?: string
  name: string
  type: string
  cron_expression: string
  is_enabled: boolean
  params_body?: string | null
  last_executed_at?: Date | null
  created_at?: Date
  updated_at?: Date
}

// task_logs表类型
export interface TaskLog {
  id?: string
  task_id: string
  status: 'success' | 'failed'
  message?: string | null
  executed_at?: Date
}

export interface TaskConfig {
  id: string
  name: string
  type: string
  cronExpression: string
}

