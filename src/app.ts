import { join } from 'path';
import AutoLoad, {AutoloadPluginOptions} from '@fastify/autoload';
import {FastifyInstance, FastifyPluginAsync, FastifyServerOptions} from 'fastify';
import * as fastify from 'fastify';

export interface AppOptions extends FastifyServerOptions, Partial<AutoloadPluginOptions> {

}
// Pass --options via CLI arguments in command to enable these options.
const options: AppOptions = {
}

const app: FastifyPluginAsync<AppOptions> = async (
    fastify,
    opts
): Promise<void> => {
  // Place here your custom code!

  // Do not touch the following lines

  // This loads all plugins defined in plugins
  // those should be support plugins that are reused
  // through your application
  void fastify.register(AutoLoad, {
    dir: join(__dirname, 'plugins'),
    options: opts
  })

  // This loads all plugins defined in routes
  // define your routes in one of these
  void fastify.register(AutoLoad, {
    dir: join(__dirname, 'routes'),
    options: opts
  })


};
export const server: FastifyInstance = fastify({
  logger: true,
  ajv: {customOptions: {$data: true}}
});

// registerRoutes(server);


server.listen({port: 8080, host: '0.0.0.0'});

server.all('/', {}, (request, reply)=> {
  console.log('servers works!')
  return reply.send('WORKS!')
})
export default app;
export { app, options }
