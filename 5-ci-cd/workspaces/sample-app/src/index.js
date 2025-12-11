const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// simple health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// main application route
app.get('/', (req, res) => {
  res.json({ message: 'Hello from CI/CD Workshop!' });
});

if (require.main === module) {
  app.listen(PORT, () => console.log(`App running on port ${PORT}`));
}

module.exports = app;
