from node:20-alpine
WORKDIR /app
COPY package.json package-lock.json 
RUN npm install
COPY server .
ENTRYPOINT npm run start
