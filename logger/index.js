import Fastify from "fastify";
import { Logger } from "./logger.js";

const fastify = Fastify({
    logger: false
})

const logger = new Logger('logs/test.log')

fastify.addHook('onRequest', async (req, res) => {
    req.start = Date.now()
})

fastify.addHook('onResponse', async (req, res) => {
    logger.info({
        ip: req.ip,
        method: req.method,
        uri: req.url,
        statusCode: res.statusCode,
        responseTime: Date.now() - req.start
    })
})

fastify.get('/test', (req, res) => {
    res.send({ message: 'response sent'} )
})

fastify.listen({ port: 3000 }, () => {
    console.log('server is runing');
})