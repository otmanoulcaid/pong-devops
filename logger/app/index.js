import Fastify from "fastify";
import { Logger } from "./logger/logger.js";
import client from 'prom-client';

const fastify = Fastify({
    logger: false
});

const logger = new Logger('logs/test.log');

const counter = new client.Counter({
    name: 'my_app_requests_total_counter',
    help: 'Number of total requests',
    labelNames: ['method', 'route', 'status_code'],
});

const register = new client.Registry();
register.registerMetric(counter);

fastify.addHook('onRequest', async (req, res) => {
    req.start = Date.now();
});

fastify.addHook('onResponse', async (req, res) => {
    const duration = Date.now() - req.start;
    counter.labels(req.method, req.url, res.statusCode).inc();

    logger.info({
        ip: req.ip,
        method: req.method,
        uri: req.url,
        statusCode: res.statusCode,
        responseTime: duration
    });
});

fastify.get('/home', (req, res) => {
    res.send({ message: 'response sent' });
});

fastify.get('/about', (req, res) => {
    res.send({ message: 'response sent' });
});

fastify.get('/info', (req, res) => {
    res.send({ message: 'response sent' });
});

fastify.get('/contact', (req, res) => {
    res.send({ message: 'response sent' });
});

fastify.get('/shop', (req, res) => {
    res.send({ message: 'response sent' });
});

fastify.get('/metrics', async (req, res) => {
    res.header('Content-Type', register.contentType);
    return await register.metrics();
});

fastify.listen({ port: 3000, host: '0.0.0.0' }, () => {
    console.log('server is running');
});
