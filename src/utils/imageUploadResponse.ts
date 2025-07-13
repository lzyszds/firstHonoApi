import { nanoid } from 'nanoid';
import sharp from 'sharp';
import path from 'path';
import fs from 'fs';
import ApiConfig from "@/domain/ApiCongfigType";
import Config from "../../config";
import { uploadImage } from "@/utils/pictureBed";
import { sleep, uploadFileLimit } from "@/utils/helpers";
import { PictureBedCreate } from "@/domain/PictureBedType";
import { getCookie } from 'hono/cookie';
import dayjs from 'dayjs';
import md5 from 'md5';
import multer from 'multer';
import { object } from 'joi';
import { fileTypeFromBuffer } from 'file-type';


interface ImageUploadResponse {
  data: {
    url: {
      size: Record<string, any>;
      url: string;
    }
  }
}

const chunksUploadData = new Map<string, File[]>()


export class ImageUploadService {
  // 允许上传的文件类型
  private static readonly ALLOWED_FILE_TYPES = [
    'image/jpg',
    'image/jpeg',
    'image/png',
    'image/gif',
    'image/bmp',
    'image/webp',
    'image/svg+xml'
  ];

  /**
   * 处理图片转换
   */
  private async convertWebpToPng(file: File, buffer: Buffer): Promise<{ file: File, buffer: Buffer }> {
    if (file.type !== 'image/webp') {
      return { file, buffer };
    }

    const pngBuffer: any = await sharp(buffer).png().toBuffer();
    const blob = new Blob([pngBuffer], { type: 'image/png' });
    const convertedFile = new File(
      [blob],
      file.name.replace('.webp', '.png'),
      { type: 'image/png' }
    );

    return {
      file: convertedFile,
      buffer: pngBuffer
    };
  }

  /**
   * 保存图片到本地缓存
   */
  private async saveImageToLocal(buffer: Buffer, filename: string): Promise<void> {
    const articleImagesPath = `/static/img/cacheImage/`;
    const uploadPath = path.join(__dirname, '../..', articleImagesPath + filename);
    //@ts-ignore
    await fs.promises.writeFile(uploadPath, buffer);
  }

  /**
   * 上传图片到图床并保存信息
   */
  public async uploadImageToPictureBed(c: any, ToolkotMapper: any): Promise<ApiConfig<any>> {
    const apiConfig = new ApiConfig(c);

    try {
      const formData = await c.req.parseBody();
      let file = formData['upload-image'] ?? formData['upload']
      //图片存放类型
      const imageDepositType = formData.type;
      //是否压缩
      const compress = Boolean(formData.compress);
      //是否完成
      const completion = formData.completion !== undefined ? JSON.parse(formData.completion) : true
      //任务id
      const taskId = formData.taskId

      if (!file) {
        throw new Error('上传文件,请检查文件是否存在');
      }

      let buffer: any, intactFile

      if (!chunksUploadData.has(taskId)) {
        chunksUploadData.set(taskId, [file])
      } else {
        chunksUploadData.get(taskId)!.push(file)
      }
      if (completion === false) return apiConfig.imageResulting('成功上传片段:' + chunksUploadData.get(taskId)!.length)

      // 获取所有分片
      const chunksFiles = chunksUploadData.get(taskId)
      const chunkFileBuffer = await chunksFiles![0].arrayBuffer()
      const fileType = await fileTypeFromBuffer(new Uint8Array(chunkFileBuffer))

      // 生成文件名
      let filename = formData.taskId + '.' + fileType?.ext;

      intactFile = new File(
        chunksFiles!,
        filename,
        { type: fileType?.mime }
      );

      // 处理 WebP 转换
      const { file: processedFile } =
        await this.convertWebpToPng(intactFile, buffer);

      // 上传图片至图床
      const res = await uploadImage(processedFile, filename) as ImageUploadResponse;

      if (!res) return apiConfig.fail('上传失败：token失效，请前往腾讯图床进行登录并获取新的token,https://om.qq.com/main/material/picManage');
      filename = filename.replace('.png', '.webp').replace('.jpeg', '.webp').replace('.jpg', '.webp')
      // 处理图片大小信息
      const sizeArr = Object.keys(res.data.url.size);
      const name = res.data.url.url.split('/').pop();

      // 保存图片信息到数据库
      await ToolkotMapper.saveImageInfo({
        name: filename,
        url: `${Config.pictureBedProxy}${name}`,
        other_sizes: sizeArr.join(','),
        derive_from: imageDepositType,
        derive_from_id: Number(formData.derive_from_id) || 0
      } as PictureBedCreate);

      // let uploadResult = await uploadFileLimit(
      //   processedFile,
      //   10,
      //   ImageUploadService.ALLOWED_FILE_TYPES,
      // );
      const processedBuffer = Buffer.from(await processedFile.arrayBuffer())
      //获取file的Buffer
      const webpBuffer = await sharp(processedBuffer).toFormat('webp').toBuffer()
      //将buffer存到本地static中
      await this.saveImageToLocal(webpBuffer, filename);

      return apiConfig.imageResult(`${Config.pictureBedProxy}${filename}`);

    } catch (error) {
      return apiConfig.fail(error instanceof Error ? error.message : '上传失败');
    }
  }
}


export default new ImageUploadService();