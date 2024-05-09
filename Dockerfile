FROM node:20-alpine
WORKDIR /app
COPY server/package.json /app
COPY server/package-lock.json /app
RUN npm install
COPY server .
ENTRYPOINT npm run start
