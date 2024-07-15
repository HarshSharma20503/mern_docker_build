# Stage 1: Build frontend
FROM node:16

WORKDIR /app/frontend

COPY frontend/package*.json ./

RUN npm install

COPY frontend/ .

RUN npm run build

WORKDIR /app/backend

COPY backend/package*.json ./

RUN npm install

COPY backend/ .

RUN cp -r /app/frontend/dist /app/backend/public

EXPOSE 8000

CMD ["node", "src/index.js"]
