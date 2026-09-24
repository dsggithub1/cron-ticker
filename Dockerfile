# /app /usr /lib
FROM --platform=linux/amd64 node:19.9-alpine3.16 AS node_amd64

# cd app
WORKDIR /app

#Dest /app
COPY package.json ./

#instalando las dependencias
RUN npm install

COPY . .

#REALIZAR TESTING

RUN npm run test

#eliminar archivos y directorios no necesarios en Produccion

RUN rm -rf tests && rm -rf node_modules

# uniccamente las dependencias de produccion
RUN npm install --prod

# commando run de la imagen
CMD [ "node" , "app.js" ]