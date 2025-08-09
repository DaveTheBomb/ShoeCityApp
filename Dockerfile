FROM node:20-alpine
WORKDIR /app

COPY . .
WORKDIR /app/Javascript

RUN npm install --include=dev

EXPOSE 3000

# Start app with nodemon
CMD ["npm", "run", "dev"]