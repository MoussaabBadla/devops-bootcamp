# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY server.js ./

# Create data directory
RUN mkdir data

# Expose port (will be mapped to different host ports)
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]