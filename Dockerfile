# /app /usr /lib
FROM node:19.2-alpine3.16

# cd app
WORKDIR /app

#Dest /app
COPY app.js package.json ./

#instalando las dependencias
RUN npm install

# commando run de la imagen
CMD [ "node" , "app.js" ]