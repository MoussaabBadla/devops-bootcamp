---
marp: true
theme: default
paginate: true
backgroundColor: #ffffff
style: |
  /* Base & Fonts */
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&family=Fira+Code:wght@500&display=swap');
  
  section {
    font-family: 'Inter', sans-serif;
    color: #000000;
    padding: 40px 60px;
    background: #ffffff;
    font-size: 1.25em;
  }

  /* Title Slides */
  section.lead {
    background: #ffffff;
    color: #000000;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    border: 4px solid #000000;
  }
  
  section.lead h1 { color: #000000; margin-bottom: 0.5em; }
  section.lead p { color: #333333; font-size: 1.5em; font-style: italic; }

  /* Typography */
  h1 { font-size: 2.5em; font-weight: 900; color: #000000; margin-bottom: 0.2em; text-transform: uppercase; letter-spacing: -1px; }
  h2 { font-size: 1.8em; font-weight: 700; color: #000000; margin-bottom: 0.6em; border-bottom: 3px solid #000000; display: inline-block; }
  h3 { font-size: 1.4em; font-weight: 700; color: #000000; margin-top: 1em; }
  
  /* Code Blocks */
  code {
    background: #f0f0f0;
    color: #000000;
    font-family: 'Fira Code', monospace;
    padding: 4px 8px;
    border: 1px solid #cccccc;
    font-size: 0.9em;
  }
  
  pre {
    background: #ffffff;
    border: 2px solid #000000;
    padding: 25px;
    box-shadow: 6px 6px 0px #000000;
  }
  pre code { color: #000000; background: transparent; padding: 0; border: none; }

  /* Visual Elements */
  .box {
    background: #ffffff;
    border: 2px solid #000000;
    padding: 20px;
    margin: 20px 0;
    box-shadow: 6px 6px 0px #000000;
  }

  .grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    text-align: center;
    margin-top: 40px;
  }
  
  .grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    margin-top: 20px;
  }

  img { 
    border: 2px solid #000000; 
    box-shadow: 6px 6px 0px #000000; 
    max-width: 90%; 
    max-height: 400px; /* Limit height to prevent overflow/cropping */
    object-fit: contain; /* Ensure image fits within box */
    display: block;
    margin: 0 auto;
    /* filter: grayscale(100%);  <-- Removed to restore color */
  }
  
  blockquote {
    border-left: 6px solid #000000;
    padding-left: 20px;
    font-style: italic;
    font-size: 1.2em;
    background: #f9f9f9;
    padding: 20px;
  }
---

<!-- _class: lead -->

# CI/CD: The Simple Way
## From Code to Production

### "How to stop worrying and love automation"

---

## The "Cooking" Analogy

Building software is like running a restaurant kitchen.

<div class="grid-3">

<div>
<h3>Code = Ingredients</h3>
(Raw materials)
</div>

<div>
<h3>Build = Cooking</h3>
(Compile/Bundle)
</div>

<div>
<h3>Deploy = Serving</h3>
(Give to customer)
</div>

</div>

<div class="box">

**CI/CD** is an **automated chef** that cooks and serves the food for you, perfectly, every single time.

</div>

---

## The Pipeline Vision

Imagine a tube connecting your laptop to the world.

![The CI/CD Pipeline Concept](images/pipeline.png)

1. **Build Factory**: Assembles the code.
2. **Scanner Gate**: Checks for bugs/quality.
3. **Launch Pad**: Blasts it to the internet.

---

## The "Old Way" (Manual)

1.  Developer writes code
2.  Developer emails code to Bob
3.  Bob puts it on a USB stick
4.  Bob walks to the server room
5.  **CRASH!** "It doesn't work!"

### The Problem?
*   **Slow**: Takes days/weeks.
*   **Risky**: Human error (Bob forgot a file).
*   **Stressful**: Deploying on Friday is terrifying.

---

## The "New Way" (CI/CD)

1.  Developer pushes code to GitHub
2.  **Automation wakes up**
3.  Automation tests the code
4.  Automation deploys the code
5.  **Success!**

### The Benefit?
*   **Fast**: Takes minutes.
*   **Safe**: Scripts don't forget files.
*   **Reliable**: Deploy on Friday with confidence.

---

<!-- _class: lead -->

# Part 2: GitHub Actions
## Your First Automation

---

## Setup in 3 Steps

GitHub Actions is **free** and built right into GitHub.

### 1. Create the File
Inside your repo, make a folder path:
`.github/workflows/pipeline.yml`

### 2. Add the Instructions
Write **YAML** (it's list of instructions).

### 3. Push and Watch
Commit your code, and see the indicators turn green!

---

## The Recipe (YAML)

This is a real workflow file. It is simple instructions.

```yaml
name: My First Automation

on: [push]                  # Trigger: When code is pushed

jobs:
  check-code:               # Job Name
    runs-on: ubuntu-latest  # Computer Type (Cloud)
    
    steps:
      - uses: actions/checkout@v3  # Step 1: Get Code
      
      - name: Run Tests            # Step 2: Test It
        run: npm test
```

---

## Hands-On Time

**Let's build a safety net.**

We want a workflow that runs our tests automatically. If the tests pass, we're happy. If they fail, we want to know!

### Your Mission:
1.  Open VS Code.
2.  Find `.github/workflows/basic-ci.yml`.
3.  Read the comments.
4.  **Action**: Push it to GitHub and see it run!

---

<!-- _class: lead -->

# Part 3: The Next Steps
## Moving Beyond Basic Testing

---

## 📦 Level Up: Docker (The Package)

Testing code is good. Packaging it is better.

**Goal**: Create a "Container" that runs anywhere (laptop, server, cloud).

### The Recipe Update
1.  **Test** the code (Ingredients are fresh?)
2.  **Build** the Docker Image (Cook the meal)
3.  **Push** to Registry (Put it in the freezer for later)

```yaml
      - name: Build & Push Docker Image
        run: |
          docker build -t my-app .
          docker push my-repo/my-app
```

---

## 🐙 Level Up: Pull Requests (The Shield)

**Don't push straight to Production!**

### The "Branch Protection" Workflow
1.  Developer creates a **Branch** (`feature-login`).
2.  Developer opens a **Pull Request (PR)**.
3.  **GitHub Actions** runs automatically on the PR.
4.  If tests Pass ✅ -> **Merge** allowed.
5.  If tests Fail ❌ -> **Merge** blocked.

**This prevents bad code from ever reaching the main branch.**

---

## 🔒 Level Up: Security (DevSecOps)

Hacker-proof your code automatically.

### "Shift Left" Security
Find vulnerabilities **before** you deploy, not after.

```yaml
      - name: Run Security Scan
        run: npm audit  # Checks for known security holes
```

**If a security hole is found, the robot stops the line.**

---

<!-- _class: lead -->

# Part 4: Jenkins
## The Enterprise Standard

---

## Smart Home vs Factory

<div class="grid-2">

<div class="box">

### GitHub Actions
**"The Smart Home"**
*   Easy to set up (Plug & Play).
*   Great for most families (Startups/Projects).
*   Lives in the Cloud.
*   **Zero maintenance.**

</div>

<div class="box">

### Jenkins
**"The Industrial Factory"**
*   Powerful, heavy machinery.
*   Great for massive scale (Enterprises).
*   You host it yourself (On-premise).
*   **Requires a maintenance crew.**

</div>

</div>

---

## Why "Enterprise"? (The 3 Reasons)

Why do big banks and legacy companies love Jenkins?

1.  **🔒 Private Networks (Air-gapped)**
    *   Some companies have servers with **NO Internet**.
    *   GitHub Actions can't reach them. Jenkins lives inside the wall.
    
2.  **🧩 Infinite Customization**
    *   Need to restart a server in 1998? There is a plugin for that.
    *   GitHub is opinionated; Jenkins lets you do *anything* (even bad things).

3.  **📜 Complex Auditing**
    *   "Who approved this deploy?"
    *   Jenkins allows complex "Manual Approval" gates required by law.

---

## How They Run: A Deep Dive

Where does your code actually execute?

<div class="grid-2">

<div class="box">

### GitHub Actions
**Runner: "Ephemeral VM"**
1.  GitHub creates a fresh VM.
2.  Runs your code.
3.  **Destroys the VM.**
*   *Clean slate every time.*

</div>

<div class="box">

### Jenkins
**Architecture: "Controller & Agents"**
1.  **Controller**: The boss (assigns work).
2.  **Agent**: The worker node (runs code).
*   *Agents are often persistent servers.*

</div>

</div>

> **Analogy**: GitHub is an Uber (new car every time). Jenkins is owning a fleet of trucks (you maintain the tires).

---

## Jenkins Speaks a Different Language

The concepts are the same, but the syntax is different.

```groovy
// Jenkinsfile (Groovy)

pipeline {
    agent any           // "runs-on: ubuntu-latest"
    
    stages {
        stage('Test') {
            steps {
                sh 'npm test'  // "run: npm test"
            }
        }
    }
}
```

**It is just a different dialect for the same instructions.**

---

<!-- _class: lead -->

# Ready to Launch?

### "Automation is good, so long as you know exactly where to put the machine."
– Eliyahu Goldratt

---

## Your Cheat Sheet

1.  **CI (Continuous Integration)**:
    *   Merging code often + Auto-testing.
    *   *Goal: Don't break the app.*

2.  **CD (Continuous Delivery)**:
    *   Auto-deploying to users.
    *   *Goal: Ship features fast.*

3.  **YAML**:
    *   The language we use to command the automation.

### Now go automate something!
