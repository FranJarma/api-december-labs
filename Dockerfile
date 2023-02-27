FROM node:14-alpine
WORKDIR /app 
COPY package*.json ./ 
COPY prisma ./
COPY .env ./
COPY tsconfig.json ./
RUN npm install
RUN npx prisma generate

COPY . . 
EXPOSE 3000 
CMD ["npm", "run", "dev"]