const request = require('supertest');
const { app, server } = require('./index');

describe('API Endpoints', () => {
  afterAll((done) => {
    server.close(done);
  });

  test('GET / should return welcome message', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.body.message).toBe('Welcome to CI/CD Workshop!');
  });

  test('GET /health should return healthy status', async () => {
    const response = await request(app).get('/health');
    expect(response.status).toBe(200);
    expect(response.body.status).toBe('healthy');
    expect(response.body.timestamp).toBeDefined();
  });

  test('GET /api/hello should return greeting', async () => {
    const response = await request(app).get('/api/hello');
    expect(response.status).toBe(200);
    expect(response.body.message).toBe('Hello, World!');
  });

  test('GET /api/hello?name=DevOps should return custom greeting', async () => {
    const response = await request(app).get('/api/hello?name=DevOps');
    expect(response.status).toBe(200);
    expect(response.body.message).toBe('Hello, DevOps!');
  });
});
