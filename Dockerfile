FROM node:20-alpine3.19

ENV NODE_ENV development

WORKDIR /app

COPY package*.json ./
COPY tsconfig.json ./
COPY tailwind.config.js ./

COPY ./src ./src
COPY ./public ./public

RUN npm install \
    && npm install -g serve \
    && npm run build \
    && rm -fr node_modules

CMD ["npm", "start"]

EXPOSE 3000