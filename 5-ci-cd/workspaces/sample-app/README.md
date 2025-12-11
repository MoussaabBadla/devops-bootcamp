# CI/CD Sample Application

A simple Node.js/Express application for demonstrating CI/CD concepts.

## Features

- RESTful API with Express.js
- Health check endpoint
- Unit tests with Jest
- Docker support
- Ready for CI/CD pipelines

## Endpoints

- `GET /` - Welcome message
- `GET /health` - Health check
- `GET /api/hello?name=YourName` - Greeting API

## Local Development

### Prerequisites

- Node.js 18+
- npm or yarn

### Setup

```bash
# Install dependencies
npm install

# Run in development mode
npm run dev

# Run tests
npm test

# Run linter
npm run lint
```

### Docker

```bash
# Build image
docker build -t ci-cd-sample-app .

# Run container
docker run -p 3000:3000 ci-cd-sample-app

# Test
curl http://localhost:3000/health
```

## CI/CD Integration

This application is designed to work with:

- **GitHub Actions**: See `.github/workflows/` for examples
- **Jenkins**: See `Jenkinsfile` for pipeline configuration

### GitHub Actions Workflows

1. **basic-ci.yml** - Run tests on every push
2. **docker-build-push.yml** - Build and push Docker images
3. **deploy-cloud-run.yml** - Deploy to Google Cloud Run

### Jenkins Pipeline

The `Jenkinsfile` defines a complete CI/CD pipeline with:
- Build stage
- Test stage
- Docker build stage
- Deploy stage

## Environment Variables

- `PORT` - Server port (default: 3000)
- `NODE_ENV` - Environment (development/production)

## Testing

```bash
# Run all tests
npm test

# Run tests with coverage
npm test -- --coverage
```

## License

MIT
