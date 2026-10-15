# Depenendcias de desarrollo
FROM node:19.9-alpine3.16 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

# BBuild y Test
FROM node:19.9-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# dependenccias de produccion
FROM node:19.9-alpine3.16 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# ejecutar la app
FROM node:19.9-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks

CMD [ "node" , "app.js" ]