FROM node:22-slim

WORKDIR /app

COPY app/ .

RUN npm i

ENTRYPOINT [ "npm", "run", "dev" ]