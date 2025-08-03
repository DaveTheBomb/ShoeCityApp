# Stage 1: Build the full project
FROM node:20-alpine
WORKDIR /app
COPY . .
WORKDIR /app/Javascript
RUN npm install

EXPOSE 3000

# Start the application
CMD ["npm", "run", "dev"]



