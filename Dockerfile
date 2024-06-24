FROM node:20-alpine

WORKDIR /app

# Połączenie instrukcji RUN w jedną
COPY package.json package-lock.json /app/
RUN npm install && mkdir /app/server

COPY server/server.js server/tests.js /app/server/

EXPOSE 3000

# Użycie notacji JSON dla ENTRYPOINT
ENTRYPOINT ["npm", "run", "start"]
