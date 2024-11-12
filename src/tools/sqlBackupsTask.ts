//备份数据库定时任务计划 每天凌晨1点执行
import dayjs from 'dayjs';
import { execa } from 'execa';
import CONFIG from '../../config';
import logger from '@/middleware/logger';


export const sqlBackupsTask = async () => {
  const backupFileName = `backup_${dayjs().format("YYYY-MM-DD")}.sql`;

  try {
    await execa('mysqldump', [
      '-u', CONFIG.dbConfig.user,
      '-p', CONFIG.dbConfig.password,
      CONFIG.dbConfig.database,
      '-r', backupFileName
    ]);
    logger.info(`数据库备份成功，备份文件名：${backupFileName}`);
  } catch (error: any) {
    logger.error(`数据库备份失败：${error.message}`);
  }
}
