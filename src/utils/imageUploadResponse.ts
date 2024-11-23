import {nanoid} from 'nanoid';
import sharp from 'sharp';
import path from 'path';
import fs from 'fs';
import ApiConfig from "@/domain/ApiCongfigType";
import Config from "../../config";
import {uploadImage} from "@/utils/pictureBed";
import {uploadFileLimit} from "@/utils/helpers";


interface ImageUploadResponse {
  data: {
    url: {
      size: Record<string, any>;
      url: string;
    }
  }
}

interface ImageInfo {
  name: string;
  url: string;
  other_sizes: string;
  derive_from: string;
  derive_from_id: number;
}

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
      return {file, buffer};
    }

    const pngBuffer = await sharp(buffer).png().toBuffer();
    const blob = new Blob([pngBuffer], {type: 'image/png'});
    const convertedFile = new File(
      [blob],
      file.name.replace('.webp', '.png'),
      {type: 'image/png'}
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
    await fs.promises.writeFile(uploadPath, buffer);
  }

  /**
   * 上传图片到图床并保存信息
   */
  public async uploadImageToPictureBed(c: any, ToolkotMapper: any): Promise<ApiConfig<string>> {
    const apiConfig = new ApiConfig<string>(c);

    try {
      const formData = await c.req.parseBody();
      const file = formData['upload-image'] as File;

      if (!file) {
        throw new Error('上传文件,请检查文件是否存在');
      }

      // 生成文件名
      const filename = nanoid() + path.extname(file.name.split('.').pop() ?? file.name) + '.webp';

      // 转换文件为 buffer
      const arrayBuffer = await file.arrayBuffer();
      let buffer = Buffer.from(new Uint8Array(arrayBuffer));

      // 处理 WebP 转换
      const {file: processedFile, buffer: processedBuffer} =
        await this.convertWebpToPng(file, buffer);

      // 上传图片至图床
      const res = await uploadImage(processedFile, filename) as ImageUploadResponse;

      // 处理图片大小信息
      const sizeArr = Object.keys(res.data.url.size);
      const name = res.data.url.url.split('/').pop();

      // 保存图片信息到数据库
      await ToolkotMapper.saveImageInfo({
        name: filename,
        url: `${Config.pictureBedProxy}${name}`,
        other_sizes: sizeArr.join(','),
        derive_from: formData.derive_from,
        derive_from_id: Number(formData.derive_from_id) || 0
      } as ImageInfo);

      // 保存本地备份
      const uploadResult = await uploadFileLimit(
        processedFile,
        10,
        ImageUploadService.ALLOWED_FILE_TYPES
      );

      if (typeof uploadResult !== 'string') {
        await this.saveImageToLocal(uploadResult, filename);
      }

      return apiConfig.success(`${Config.pictureBedProxy}${name}`);

    } catch (error) {
      return apiConfig.fail(error instanceof Error ? error.message : '上传失败');
    }
  }
}


export default new ImageUploadService();