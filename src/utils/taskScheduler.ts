const schedule = require('node-schedule');

// 存储任务的 Map
const tasks = new Map();

// 创建定时任务
function createTask(taskId: string, cronExpression: string, taskFunction: () => void) {
  const job = schedule.scheduleJob(cronExpression, taskFunction);
  tasks.set(taskId, job);
  return job;
}

// 销毁特定任务
function destroyTask(taskId: string) {
  const job = tasks.get(taskId);
  if (job) {
    job.cancel();
    tasks.delete(taskId);
    console.log(`Task ${taskId} destroyed`);
    return true;
  } else {
    console.log(`Task ${taskId} not found`);
    return false;
  }
}

// 销毁所有任务
function destroyAllTasks() {
  tasks.forEach((job, taskId) => {
    job.cancel();
    console.log(`Task ${taskId} destroyed`);
  });
  tasks.clear();
  console.log('All tasks destroyed');
}

// // 示例使用
// createTask('dailyEmail', '0 9 * * *', () => {
//   console.log('Sending daily email...');
// });

// createTask('weeklyReport', '0 10 * * 1', () => {
//   console.log('Generating weekly report...');
// });

// // 销毁特定任务
// setTimeout(() => {
//   destroyTask('dailyEmail');
// }, 10000);

// 销毁所有任务（例如在应用关闭时）
process.on('SIGINT', () => {
  destroyAllTasks();
  process.exit();
});

export { createTask, destroyTask, destroyAllTasks };
