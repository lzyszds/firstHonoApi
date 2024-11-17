import {Hono} from 'hono';
import openAIController from '../../controllers/openAIController';

interface Routes {
  [key: string]: { [key: string]: (c: any) => any };

  get: { [key: string]: (c: any) => any };
  post: { [key: string]: (c: any) => any };
}

const router = new Hono();

const routes: Routes = {
  get: {
    //  GPT3.5开放ai
    '/getAifox': openAIController.getAifox,
    //  获取ai key列表
    '/getAiKeysList': openAIController.getAiKeysList,
    //  询问阿里云的硅基ai
    '/getSiliconflowiAi': openAIController.getSiliconflowiAi
  },
  post: {
    //  新增ai key
    '/addAiKey': openAIController.addAiKey,
    //  更新ai key
    '/updateAiKey': openAIController.updateAiKey,
    //  删除ai key
    '/deleteAiKey': openAIController.deleteAiKey
  }
}


for (const method in routes) {
  for (const path in routes[method]) {
    //@ts-ignore
    router[method](path, routes[method][path]);
  }
}


export default router
