# 1. Base Image: Use Node.js 18 on Alpine Linux (lightweight)
FROM node:18-alpine

# 2. Working Directory: Where our app lives inside the container
WORKDIR /app

# 3. Dependencies: Copy package files first (caching layer)
COPY package*.json ./
RUN npm install --production

# 4. Source Code: Copy the rest of our application
COPY . .

# 5. Network: Open port 3000
EXPOSE 3000

# 6. Start: Command to run our app
CMD ["node", "src/index.js"]
