import jwt, {JwtPayload} from 'jsonwebtoken';
import {User} from "@/domain/User";

// 用于签名JWT的密钥，保持私密, 建议从环境变量读取
const secretKey = process.env.JWT_SECRET || '395878870lzyszds878870';

// 生成JWT
function generateToken(user: User, expiresIn = '1h') {
  try {
    // 精简 payload
    const payload = {
      uid: user.uid,
      username: user.username,
      power: user.power,
      head_img: user.head_img,
      uname: user.uname,
      signature: user.signature,
      whether_use: user.whether_use,
    };
    return jwt.sign(payload, secretKey, {expiresIn});
  } catch (error) {
    console.error('Error generating token:', error);
    throw new Error('Failed to generate token');
  }
}

// 验证JWT
function verifyToken(token: string): JwtPayload | null {
  try {
    const decoded = jwt.verify(token, secretKey);
    return typeof decoded === 'string' ? JSON.parse(decoded) : decoded;
  } catch (error: any) {
    console.error('Error verifying token:', error);
    if (error.name === 'TokenExpiredError') {
      throw new Error('Token expired');
    } else {
      throw new Error('Invalid token');
    }
  }
}

// 验证并解码JWT
function decodeToken(token: string): User {
  try {
    const decoded = jwt.verify(token, secretKey);
    return typeof decoded === 'string' ? JSON.parse(decoded) : decoded;
  } catch (error: any) {
    console.error('Error verifying and decoding token:', error);
    if (error.name === 'TokenExpiredError') {
      throw new Error('Token expired');
    } else {
      throw new Error('Invalid token');
    }
  }
}

export {generateToken, verifyToken, decodeToken};
