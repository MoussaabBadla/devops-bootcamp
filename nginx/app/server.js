const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;
const INSTANCE_ID =
  process.env.INSTANCE_ID || `instance-${Math.floor(Math.random() * 1000)}`;
const COUNTER_FILE = path.join(__dirname, "data", "counter.txt");

const dataDir = path.dirname(COUNTER_FILE);
if (!fs.existsSync(dataDir)) {
  fs.mkdirSync(dataDir);
}

if (!fs.existsSync(COUNTER_FILE)) {
  fs.writeFileSync(COUNTER_FILE, "0");
}

function incrementCounter() {
  let count = 0;
  try {
    count = parseInt(fs.readFileSync(COUNTER_FILE, "utf8")) || 0;
  } catch (err) {
    count = 0;
  }
  count++;
  fs.writeFileSync(COUNTER_FILE, count.toString());
  return count;
}

app.use(express.json());

app.get("/", (req, res) => {
  const count = incrementCounter();
  const timestamp = new Date().toISOString();

  const html = `
    <!DOCTYPE html>
    <html>
    <head>
        <title>NGINX Workshop App</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
            .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
            h1 { color: #2c3e50; }
            .info-box { background-color: #e8f4fd; padding: 15px; border-radius: 5px; margin: 15px 0; }
            .counter { font-size: 2em; font-weight: bold; color: #33414bff; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>NGINX Workshop Demo App</h1>
            <div class="info-box">
                <p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
                <p><strong>Request Count:</strong> <span class="counter">${count}</span></p>
                <p><strong>Timestamp:</strong> ${timestamp}</p>
            </div>
            <p>This application demonstrates the use of NGINX as a reverse proxy and load balancer.</p>
            <p>Each request increments the counter and shows which instance handled it.</p>
            <h3>API Endpoints:</h3>
            <ul>
                <li><code>GET /</code> - This HTML page</li>
                <li><code>GET /api/count</code> - JSON response with counter and instance info</li>
                <li><code>GET /health</code> - Health check endpoint</li>
            </ul>
        </div>
    </body>
    </html>
    `;

  res.send(html);
});

app.get("/api/count", (req, res) => {
  const count = incrementCounter();
  const timestamp = new Date().toISOString();

  res.json({
    count: count,
    instanceId: INSTANCE_ID,
    timestamp: timestamp,
    port: PORT,
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy",
    instanceId: INSTANCE_ID,
    timestamp: new Date().toISOString(),
  });
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Something went wrong!" });
});

app.use((req, res) => {
  res.status(404).json({ error: "Not Found" });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Instance ID: ${INSTANCE_ID}`);
});

