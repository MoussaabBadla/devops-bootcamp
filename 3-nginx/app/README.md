# NGINX Workshop Demo Application

This is a simple Node.js application designed for demonstrating NGINX load balancing concepts in a DevOps workshop.

## Application Overview

The app is a simple counter service that:
- Shows which instance handled each request (useful for demonstrating load balancing)
- Tracks the number of requests to each instance
- Provides health check endpoints
- Runs on multiple ports to demonstrate horizontal scaling

## Files Included

- `server.js` - Main Node.js application
- `package.json` - Dependencies (Express.js)
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Multi-instance deployment
- `nginx.conf` - Example NGINX configuration for load balancing

## How to Run

### 1. Run Multiple Instances with Docker Compose

```bash
cd app
docker-compose up --build
```

This will start 3 instances of the application:
- Instance 1 on port 3001
- Instance 2 on port 3002
- Instance 3 on port 3003

### 2. Test Individual Instances

You can access each instance directly:
- http://localhost:3001
- http://localhost:3002
- http://localhost:3003

### 3. Set Up NGINX Load Balancer

To see load balancing in action, configure NGINX with the provided `nginx.conf` file to distribute requests between the instances.

## Application Endpoints

- `GET /` - HTML page showing instance info and request counter
- `GET /api/count` - JSON response with counter and instance info
- `GET /health` - Health check endpoint

## Workshop Scenarios

This application can be used to demonstrate:

1. **Scaling Problem**: Single instance handling all requests
2. **Horizontal Scaling**: Multiple instances behind NGINX
3. **Load Balancing**: NGINX distributing requests between instances
4. **Health Checks**: NGINX routing around failed instances
5. **Route-Based Proxying**: Different paths to different services