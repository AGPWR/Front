FROM node:20-alpine
WORKDIR /app
COPY package.json /app
COPY package-lock.json /app
RUN npm instal
RUN mkdir /app/server
COPY server/server.js /app/server/server.js
COPY server/tests.js /app/server/tests.js
EXPOSE 3000
ENTRYPOINT npm run start
