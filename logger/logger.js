import winston from 'winston'

export class Logger
{
	constructor(filename, level = 'debug')
	{
		this.logger = winston.createLogger({
			level,
			format: winston.format.combine(
				winston.format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
				winston.format.printf(({ timestamp, level, message }) =>
					`[${timestamp}] ${level.toUpperCase()} - ${message}`
				)
			),
			transports: [
				new winston.transports.Console(),
				new winston.transports.File({ filename })
			]
		});
	}

	#formatter(metadata)
	{
		const { ip, uri, method, responseTime, statusCode, message } = metadata;

		return `
			Message: ${message || '?'} - IP: ${ip || '?'} - method: ${method || '?'} - URL: ${uri || '?'} - \
Response Time: ${responseTime || '?'} - Status Code: ${statusCode || '?'}
		`.trim();
	}

	info(metadata)
	{
		this.logger.info(this.#formatter(metadata))
	}

	debug(metadata)
	{
		this.logger.debug(this.#formatter(metadata))
	}

	warn(metadata)
	{
		this.logger.warn(this.#formatter(metadata))
	}

	error(metadata)
	{
		this.logger.error(this.#formatter(metadata))
	}
}
