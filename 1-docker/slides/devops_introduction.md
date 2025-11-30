---
marp: true
theme: default
paginate: true
backgroundColor: #ffffff
style: |
  /* Global Styles */
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
  
  section {
    background: #ffffff;
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    color: #1a1a1a;
    padding: 60px 80px;
    font-size: 1.1em;
    line-height: 1.6;
  }
  
  /* Headers */
  h1 {
    color: #000000;
    font-size: 2.8em;
    font-weight: 700;
    margin-bottom: 0.5em;
    letter-spacing: -0.02em;
  }
  
  h2 {
    color: #1a1a1a;
    font-size: 1.8em;
    font-weight: 600;
    margin-bottom: 0.8em;
    margin-top: 1em;
    border-bottom: 2px solid #e5e5e5;
    padding-bottom: 0.3em;
  }
  
  h3 {
    color: #2a2a2a;
    font-size: 1.3em;
    font-weight: 600;
    margin-top: 1.2em;
  }
  
  /* Code Blocks */
  code {
    background: #f5f5f5;
    color: #1a1a1a;
    padding: 3px 8px;
    border-radius: 4px;
    font-size: 0.9em;
    font-family: 'SF Mono', 'Monaco', 'Consolas', monospace;
    border: 1px solid #e5e5e5;
  }
  
  pre {
    background: #1a1a1a;
    border-radius: 8px;
    padding: 24px;
    margin: 1.5em 0;
    border: 1px solid #000000;
  }
  
  pre code {
    background: transparent;
    color: #ffffff;
    font-size: 0.85em;
    line-height: 1.6;
    border: none;
  }
  
  /* Lists */
  ul, ol {
    line-height: 1.8;
    margin-left: 1.5em;
  }
  
  li {
    margin-bottom: 0.6em;
    color: #1a1a1a;
  }
  
  li strong {
    color: #000000;
    font-weight: 600;
  }
  
  /* Tables */
  table {
    border-collapse: collapse;
    width: 100%;
    margin: 1.5em 0;
    border: 1px solid #e5e5e5;
  }
  
  thead {
    background: #000000;
    color: #ffffff;
  }
  
  th {
    padding: 16px;
    text-align: left;
    font-weight: 600;
    border-bottom: 2px solid #000000;
  }
  
  td {
    padding: 14px 16px;
    border-bottom: 1px solid #e5e5e5;
    background: #ffffff;
  }
  
  tbody tr:nth-child(even) td {
    background: #fafafa;
  }
  
  tbody tr:hover td {
    background: #f5f5f5;
  }
  
  /* Blockquotes */
  blockquote {
    border-left: 4px solid #000000;
    background: #f5f5f5;
    padding: 16px 24px;
    margin: 1.5em 0;
    font-style: italic;
    color: #2a2a2a;
  }
  
  /* Links */
  a {
    color: #000000;
    text-decoration: none;
    font-weight: 600;
    border-bottom: 2px solid #000000;
  }
  
  a:hover {
    opacity: 0.7;
  }
  
  /* Images */
  img {
    max-width: 85%;
    margin: 1.5em auto;
    display: block;
    border: 1px solid #e5e5e5;
  }
  
  /* Page Numbers */
  section::after {
    color: #666666;
    font-weight: 500;
  }
  
  /* Title Slides */
  section.title {
    background: #000000;
    color: #ffffff;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  
  section.title h1 {
    color: #ffffff;
    font-size: 3.5em;
    font-weight: 700;
    margin-bottom: 0.3em;
  }
  
  section.title h2 {
    color: #cccccc;
    border: none;
    padding: 0;
    font-size: 1.5em;
    font-weight: 400;
  }
  
  /* Emphasis */
  em {
    font-style: normal;
    font-weight: 600;
    color: #000000;
  }
  
  strong {
    font-weight: 700;
    color: #000000;
  }
  
  /* Horizontal Rules */
  hr {
    border: none;
    border-top: 1px solid #e5e5e5;
    margin: 2em 0;
  }
---


# Introduction to DevOps & Docker

---

## What is DevOps?

> "DevOps is the combination of cultural philosophies, practices, and tools that increases an organization’s ability to deliver applications and services at high velocity."

<p style="text-align: right"> — Amazon Web Services (AWS)</p>



---

## What is DevOps?

> "DevOps is a software development methodology that unites development and operations teams to deliver software faster, more securely, and more efficiently."

<p style="text-align: right"> — GitLab</p>



---

## What is DevOps?

> "DevOps is a set of practices that combines software development and IT operations to deliver software solutions more quickly, reliably, and stably. It fundamentally focuses on culture, automation, platform design, and constant feedback loops to enable faster, high-quality service delivery and greater business value."

<p style="text-align: right"> — Red Hat</p>


---

## The Evolution of Software Delivery

### 1. The Waterfall Model (The Old Way)

*   **Linear Process**: Requirements -> Design -> Code -> Test -> Deploy.
*   **The Problem**:
    *   **Slow**: Testing happens at the end.
    *   **Rigid**: Hard to change requirements once started.
    *   **Risk**: "Big Bang" releases often fail.
    *   **Silos**: Dev and Ops work separately.
    *   **Feedback Delay**: Users see the product months later.
    *   **Example**: Building a house without seeing it until it's done.
  
![Waterfall Model](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmOWYnLCAnZWRnZUxhYmVsQmFja2dyb3VuZCc6JyNmZmZmZmYnLCAndGVydGlhcnlDb2xvcic6ICcjZmZmMGYwJ30sICdmbG93Y2hhcnQnOiB7J25vZGVTcGFjaW5nJzogNTAsICdyYW5rU3BhY2luZyc6IDgwfX19JSUKZ3JhcGggTFIKICAgIEFbUmVxdWlyZW1lbnRzXSAtLT4gQltEZXNpZ25dCiAgICBCIC0tPiBDW0ltcGxlbWVudGF0aW9uXQogICAgQyAtLT4gRFtWZXJpZmljYXRpb25dCiAgICBEIC0tPiBFW01haW50ZW5hbmNlXQogICAgc3R5bGUgQSBmaWxsOiNmOWYsc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweAogICAgc3R5bGUgQiBmaWxsOiNmOWYsc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweAogICAgc3R5bGUgQyBmaWxsOiNmOWYsc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweAogICAgc3R5bGUgRCBmaWxsOiNmOWYsc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweAogICAgc3R5bGUgRSBmaWxsOiNmOWYsc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweA==)

---

## 2. The "Wall of Confusion" (Silos)

*   **Development**: Wants **Change** (New features, updates).
*   **Operations**: Wants **Stability** (No bugs, uptime).
*   **Result**: Conflict. Devs toss code "over the wall" to Ops. Ops struggle to run it.

> "It worked on my machine!" — Every Developer, ever.


---

## 3.1 Agile Methodology

*   **Concept**: Break work into small, iterative cycles called **Sprints** (usually 2 weeks).
*   **Goal**: Get feedback fast.
*   **Process**: Plan -> Dev -> Test -> Review -> Repeat.
*   **Benefits**:
    *   Faster delivery of features.
    *   More flexibility to change.
    *   Continuous improvement based on feedback.

![Agile Loop](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnZWRnZUxhYmVsQmFja2dyb3VuZCc6JyNmZmZmZmYnLCAndGVydGlhcnlDb2xvcic6ICcjZmZmMGYwJ319fSUlCmdyYXBoIExSCiAgICBzdWJncmFwaCAiU3ByaW50IDEiCiAgICAgICAgUDFbUGxhbl0gLS0+IEQxW0Rldl0gLS0+IFQxW1Rlc3RdIC0tPiBSMVtSZXZpZXddCiAgICBlbmQKICAgIHN1YmdyYXBoICJTcHJpbnQgMiIKICAgICAgICBQMltQbGFuXSAtLT4gRDJbRGV2XSAtLT4gVDJbVGVzdF0gLS0+IFIyW1Jldmlld10KICAgIGVuZAogICAgUjEgLS0+IFAy)

---

## 3.2 The "Agile Gap"

*   **The Problem**: Agile teams focused on "Code Complete".
*   **The Reality**: Code isn't valuable until it's **running in production**.
*   **The Bottleneck**: Operations was still working in a "Waterfall" way (slow, manual deployments).
*   **Solution**: We need to extend Agile principles *beyond* code, into Operations.
*   **Enter DevOps**: Bridging Dev and Ops for faster, reliable delivery.

---

## 3.3 The Power of Automation

*   **Manual**: Slow, Error-prone, Boring.
*   **Automated**: Fast, Consistent, Scalable.
*   **What do we automate?**
    *   **Testing**: Run 1000s of tests in minutes.
    *   **Infrastructure**: Build servers with code (IaC).
    *   **Deployment**: Push to production with one click.
    *   **Monitoring**: Automatically track performance & errors.
    *   **Feedback**: Gather user data automatically.

![Automation Pipeline](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyM5OWNjZmYnLCAnZWRnZUxhYmVsQmFja2dyb3VuZCc6JyNmZmZmZmYnLCAndGVydGlhcnlDb2xvcic6ICcjZTZmMmZmJ319fSUlCmdyYXBoIExSCiAgICBDW0NvZGUgQ29tbWl0XSAtLT4gQltCdWlsZF0KICAgIEIgLS0+IFRbQXV0byBUZXN0XQogICAgVCAtLT4gU1tTdGFnaW5nXQogICAgUyAtLT4gUFtQcm9kdWN0aW9uXQogICAgc3R5bGUgQyBmaWxsOiM5Y2Ysc3Ryb2tlOiMzMzMKICAgIHN0eWxlIFAgZmlsbDojZjk2LHN0cm9rZTojMzMz)

---

## 3.4 Agile vs DevOps: The Workflow Shift

*   **Agile Focus**: Software Development speed. (Dev + QA)
*   **DevOps Focus**: End-to-End Delivery speed. (Dev + QA + Ops)
*   **The Shift**:
    *   *Agile*: "Done" = Code is written & tested.
    *   *DevOps*: "Done" = Code is running in production.

![Team Topology](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggVEQKICAgIHN1YmdyYXBoICJBZ2lsZSAoT3BzIGlzIFNlcGFyYXRlKSIKICAgICAgICBBW0RldiArIFFBIFRlYW1dIC0tICJUaHJvdyBvdmVyIHdhbGwiIC0tPiBCW09wcyBUZWFtXQogICAgZW5kCiAgICAKICAgIHN1YmdyYXBoICJEZXZPcHMgKFVuaWZpZWQpIgogICAgICAgIENbRGV2ICsgUUEgKyBPcHMgVGVhbV0KICAgIGVuZAogICAgCiAgICBzdHlsZSBBIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgQiBmaWxsOiM5OWNjZmYsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEMgZmlsbDojOTlmZjk5LHN0cm9rZTojMzMz)

---

## The DevOps Lifecycle (The Infinite Loop)

*   **Continuous Integration (Dev)**:
    *   **Plan**: Define features & requirements based on user feedback.
    *   **Code**: Write code & commit to version control (Git).
    *   **Build**: Compile code & create artifacts (Docker Images).
    *   **Test**: Automated Unit & Integration tests.
*   **Continuous Delivery (Ops)**:
    *   **Release**: Versioning & Change Management.
    *   **Deploy**: Push to Staging/Production environments.
    *   **Operate**: Manage infrastructure & scaling.
    *   **Monitor**: Track performance, logs, & **User Feedback**.
*   **The Key**: **Feedback** from "Monitor" goes back to "Plan".
*   **Architecture Note**: DevOps works best with **Microservices** (small, independent services) rather than Monoliths, as they can be deployed and scaled independently.
*   
---
![DevOps Lifecycle](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIHN1YmdyYXBoICJEZXYgKENvbnRpbnVvdXMgSW50ZWdyYXRpb24pIgogICAgICAgIFBsYW4gLS0+IENvZGUgLS0+IEJ1aWxkIC0tPiBUZXN0CiAgICBlbmQKICAgIAogICAgc3ViZ3JhcGggIk9wcyAoQ29udGludW91cyBEZWxpdmVyeSkiCiAgICAgICAgUmVsZWFzZSAtLT4gRGVwbG95IC0tPiBPcGVyYXRlIC0tPiBNb25pdG9yCiAgICBlbmQKICAgIAogICAgVGVzdCAtLT4gUmVsZWFzZQogICAgTW9uaXRvciAtLSAiQ29udGludW91cyBGZWVkYmFjayIgLS0+IFBsYW4KICAgIAogICAgc3R5bGUgUGxhbiBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIENvZGUgZmlsbDojZmZjYzAwLHN0cm9rZTojMzMzCiAgICBzdHlsZSBCdWlsZCBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIFRlc3QgZmlsbDojZmZjYzAwLHN0cm9rZTojMzMzCiAgICAKICAgIHN0eWxlIFJlbGVhc2UgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBEZXBsb3kgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBPcGVyYXRlIGZpbGw6Izk5Y2NmZixzdHJva2U6IzMzMwogICAgc3R5bGUgTW9uaXRvciBmaWxsOiM5OWNjZmYsc3Ryb2tlOiMzMzM=)

---

## From Ideology to Implementation

*   **The "As Code" Movement**: We treat *everything* like software.
*   **Infrastructure as Code (IaC)**:
    *   Instead of clicking buttons in AWS/GCP, we write **Terraform** files.
*   **Pipeline as Code**:
    *   Instead of manual builds, we write **GitHub Actions** or **Cloud Build** (YAML).
*   **Benefit**: Version control, Peer Review, and Rollbacks for *Infrastructure*.

---

## The DevOps Toolchain (Mapping)

*   **Ideology** -> **Tool (Implementation)**
*   **Collaboration** -> **Git** (Shared History)
*   **Automation** -> **CI/CD Pipelines** (Cloud Build)
*   **Portability** -> **Docker** (Standard Package)
*   **Scalability** -> **Kubernetes** (GKE)
*   **Infrastructure** -> **Terraform** (IaC)

![DevOps Toolchain](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggVEQKICAgIHN1YmdyYXBoICJJZGVvbG9neSIKICAgICAgICBDW0NvbGxhYm9yYXRpb25dCiAgICAgICAgQVtBdXRvbWF0aW9uXQogICAgICAgIFBbUG9ydGFiaWxpdHldCiAgICAgICAgU1tTY2FsYWJpbGl0eV0KICAgICAgICBJW0luZnJhc3RydWN0dXJlXQogICAgZW5kCiAgICAKICAgIHN1YmdyYXBoICJJbXBsZW1lbnRhdGlvbiBHQ1AgU3RhY2siCiAgICAgICAgR2l0WyJHaXQgLSBWZXJzaW9uIENvbnRyb2wiXQogICAgICAgIFBpcGVbIkNJL0NEIFBpcGVsaW5lcyAtIENsb3VkIEJ1aWxkIl0KICAgICAgICBEb2NrWyJEb2NrZXIgLSBDb250YWluZXJzIl0KICAgICAgICBLOHNbIkt1YmVybmV0ZXMgLSBHS0UiXQogICAgICAgIFRGWyJUZXJyYWZvcm0gLSBJYUMiXQogICAgZW5kCiAgICAKICAgIEMgLS0+IEdpdAogICAgQSAtLT4gUGlwZQogICAgUCAtLT4gRG9jawogICAgUyAtLT4gSzhzCiAgICBJIC0tPiBURgogICAgCiAgICBzdHlsZSBDIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgQSBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIFAgZmlsbDojZmZjYzAwLHN0cm9rZTojMzMzCiAgICBzdHlsZSBTIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgSSBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIAogICAgc3R5bGUgR2l0IGZpbGw6Izk5Y2NmZixzdHJva2U6IzMzMwogICAgc3R5bGUgUGlwZSBmaWxsOiM5OWNjZmYsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIERvY2sgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBLOHMgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBURiBmaWxsOiM5OWNjZmYsc3Ryb2tlOiMzMzM=)

---

# Docker

---

## How we run apps? The Evolution

*   **The Old Way (Bare Metal)**: Install everything directly on the server.
    *   *Problem*: "Dependency Hell" - conflicts between apps.
    
*   **The Better Way (Virtual Machines)**: Each app gets its own OS.
    *   **Concept**: Running multiple "Virtual Machines" (VMs) on one physical server.
    *   **Key Component**: **Hypervisor** (Software that manages VMs).
    *   **Pros**: Complete isolation (OS level).
    *   **Cons**: Heavy, slow to start, uses lots of RAM/CPU.
    
*   **The Modern Way (Containers)**: Lightweight isolation, shared OS.
    *   *Solution*: Fast, efficient, portable.

---

## Containerization (The New Way)

*   **Concept**: Packaging an app with *only* what it needs (code + libraries).
*   **Key Difference**: Shares the Host OS Kernel (no full OS per app).
*   **Pros**: Lightweight, starts in seconds, portable.

---

## Visual Comparison

![Virtualization vs Containerization](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNhZGQ4ZTYnLCAnc2Vjb25kYXJ5Q29sb3InOiAnI2YwZjhmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggVEQKICAgIHN1YmdyYXBoICJWaXJ0dWFsaXphdGlvbiAoSGVhdnkpIgogICAgICAgIEFbSGFyZHdhcmVdIC0tPiBCW0h5cGVydmlzb3JdCiAgICAgICAgQiAtLT4gQ1siVk0gMSAoRnVsbCBPUyArIEFwcCkiXQogICAgICAgIEIgLS0+IERbIlZNIDIgKEZ1bGwgT1MgKyBBcHApIl0KICAgIGVuZAogICAgCiAgICBzdWJncmFwaCAiQ29udGFpbmVyaXphdGlvbiAoTGlnaHQpIgogICAgICAgIEVbSGFyZHdhcmVdIC0tPiBGW0hvc3QgT1NdCiAgICAgICAgRiAtLT4gR1tDb250YWluZXIgRW5naW5lXQogICAgICAgIEcgLS0+IEhbIkNvbnRhaW5lciAxIChBcHAgb25seSkiXQogICAgICAgIEcgLS0+IElbIkNvbnRhaW5lciAyIChBcHAgb25seSkiXQogICAgZW5k)

---

## Comparison: VMs vs Containers

| Feature | Virtual Machines (VMs) | Containers |
| :--- | :--- | :--- |
| **Weight** | Heavy (GBs) | Light (MBs) |
| **Speed** | Slow (Minutes to boot) | Fast (Seconds to start) |
| **Isolation** | Strong (Full OS) | Good (Process level) |
| **Best For** | Different OS needs | Microservices, Apps |

---

## When to use what?

### Use Virtual Machines (VMs) when:
*   You need to run **different Operating Systems** (e.g., Linux on Windows).
*   You need **strong security isolation** (e.g., running untrusted code).
*   You have legacy apps that need a full OS environment.

### Use Containers (Docker) when:
*   You want to **deploy applications** quickly.
*   You want consistency (works on my machine = works in production).
*   You are building **Microservices**.
*   You want to maximize server efficiency (run more apps on less hardware).

---

## How do Containers Actually Work?

*   **It's just a Process**: A container is a standard Linux process, but isolated.
*   **Shared Kernel**: It uses the *Host OS* kernel (the brain of the OS).
*   **Isolation (Namespaces)**: The container *thinks* it's the only thing running. It can't see other processes.
*   **Limits (Cgroups)**: We can limit how much CPU/RAM a container uses.

> **Analogy**:
> *   **VM**: A separate house with its own infrastructure.
> *   **Container**: A room in a shared house (shared plumbing/electric), but with a locked door.

---

## Core Docker Concepts

### 1. Dockerfile (The Recipe)
*   A text file with instructions.
*   Tells Docker *how* to build your app.
*   Example: "Start with Python, copy my code, run `app.py`".

### 2. Image (The Blueprint)
*   The result of building a Dockerfile.
*   Read-only template.
*   You can't change it once built (immutable).
---
### 3. Container (The House)
*   A runnable instance of an Image.
*   You can start, stop, and delete it.
*   You can run many containers from one image.

### 4. Volume (The Storage)
*   Containers are temporary If you delete them, data is lost.
*   **Volumes** let you save data *outside* the container so it persists.

---

## What is Docker?

*   **The Tool**: The most popular platform for creating and running containers.
*   **The Promise**: "Build once, run anywhere."
*   **Why it wins**:
    *   Standardized format.
    *   Huge ecosystem (Docker Hub).
    *   Developer friendly.
    
---


# Part 1: Containerize an Application

---

## What We'll Build

*   **Project**: A simple Todo List application
*   **Tech Stack**: Node.js + React
*   **Goal**: Package it into a Docker container
*   **Why?**: Learn the basics of Dockerfiles and building images

---

## Step 1: Get the Application

```bash
# Clone the sample app
git clone https://github.com/docker/getting-started-app.git
cd getting-started-app
```

*   This is a pre-built Todo app
*   We'll focus on **containerizing** it, not building it from scratch

---

## Step 2: Create a Dockerfile

**What is a Dockerfile?**
*   A text file with instructions to build an image
*   Think of it as a **recipe** for your container

Create a file named `Dockerfile` in the project root

---

## Dockerfile Example

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "src/index.js"]
```

---

## Understanding the Dockerfile

| Line | What it does |
|------|--------------|
| `FROM node:18-alpine` | Start with Node.js 18 (lightweight Alpine Linux) |
| `WORKDIR /app` | Set `/app` as the working directory |
| `COPY package*.json ./` | Copy package.json files first (for caching) |
| `RUN npm install` | Install Node.js dependencies |
| `COPY . .` | Copy all app files |
| `EXPOSE 3000` | Document that the app uses port 3000 |
| `CMD ["node", "src/index.js"]` | Command to run when container starts |

---

## Step 3: Build the Image

```bash
# Build the image
docker build -t getting-started .
```

**What's happening?**
*   `-t getting-started` = Tag (name) the image "getting-started"
*   `.` = Use the current directory (where Dockerfile is)

**Output**: Docker reads the Dockerfile and creates an image layer by layer

---

## Step 4: Run the Container

```bash
# Run the container
docker run -d -p 3000:3000 getting-started
```

**Flags explained:**
*   `-d` = Detached mode (run in background)
*   `-p 3000:3000` = Map port 3000 on host to port 3000 in container
*   `getting-started` = The image name

**Test it**: Open `http://localhost:3000` in your browser!

---

## Visual: Build → Run Flow

![Docker Build and Run](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyM5OWNjZmYnLCAnc2Vjb25kYXJ5Q29sb3InOiAnI2ZmY2MwMCcsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIEFbRG9ja2VyZmlsZV0gLS0gImRvY2tlciBidWlsZCIgLS0+IEJbSW1hZ2VdCiAgICBCIC0tICJkb2NrZXIgcnVuIiAtLT4gQ1tDb250YWluZXJdCiAgICBDIC0tPiBEWyJBcHAgUnVubmluZyBvbiBwb3J0IDMwMDAiXQogICAgCiAgICBzdHlsZSBBIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgQiBmaWxsOiM5OWNjZmYsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEMgZmlsbDojOTlmZjk5LHN0cm9rZTojMzMzCiAgICBzdHlsZSBEIGZpbGw6I2Y5NixzdHJva2U6IzMzMw==)


---


# Part 2: Update the Application

---

## The Problem

*   You made changes to your code
*   The old container is still running the **old version**
*   **Question**: How do we update it?

---

## Step 1: Modify the Code

Edit `src/static/js/app.js` (line 56):

```javascript
// OLD
<p className="text-center">No items yet! Add one above!</p>

// NEW
<p className="text-center">You have no todo items yet! Add one above!</p>
```

---

## Step 2: Rebuild the Image

```bash
# Rebuild with the same tag
docker build -t getting-started .
```

*   Docker creates a **new version** of the image
*   The old container is still running the old image

---

## Step 3: Stop and Remove Old Container

```bash
# List running containers
docker ps

# Stop the container
docker stop <container-id>

# Remove the container
docker rm <container-id>

# OR do it in one command
docker rm -f <container-id>
```

**Why remove?** You can't run two containers on the same port!

---

## Step 4: Start the New Container

```bash
# Run the updated image
docker run -d -p 3000:3000 getting-started
```

**Check the browser**: You should see the updated text!

---

## Visual: Update Workflow

![Update Workflow](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIEFbQ2hhbmdlIENvZGVdIC0tPiBCW1JlYnVpbGQgSW1hZ2VdCiAgICBCIC0tPiBDW1N0b3AgT2xkIENvbnRhaW5lcl0KICAgIEMgLS0+IERbUmVtb3ZlIE9sZCBDb250YWluZXJdCiAgICBEIC0tPiBFW1J1biBOZXcgQ29udGFpbmVyXQogICAgCiAgICBzdHlsZSBBIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgQiBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEMgZmlsbDojZjk2LHN0cm9rZTojMzMzCiAgICBzdHlsZSBEIGZpbGw6I2Y5NixzdHJva2U6IzMzMwogICAgc3R5bGUgRSBmaWxsOiM5OWZmOTksc3Ryb2tlOiMzMzM=)

---


# Part 3: Share the Application

---

## Why Share Images?

*   **Collaboration**: Other developers can run your app
*   **Deployment**: Run on servers, cloud, anywhere
*   **Docker Hub**: Like GitHub, but for Docker images

---

## Step 1: Create a Docker Hub Account

1. Go to [hub.docker.com](https://hub.docker.com)
2. Sign up for a free account
3. Remember your username!

---

## Step 2: Create a Repository

*   On Docker Hub, click **"Create Repository"**
*   **Name**: `getting-started`
*   **Visibility**: Public
*   Click **"Create"**

---

## Step 3: Login to Docker Hub

```bash
# Login from terminal
docker login
```

*   Enter your Docker Hub username and password
*   You'll see: `Login Succeeded`

---

## Step 4: Tag Your Image

```bash
# Tag format: username/repository:tag
docker tag getting-started YOUR_USERNAME/getting-started
```

**Example**:
```bash
docker tag getting-started johndoe/getting-started
```

*   This creates an **alias** for your image
*   The tag matches your Docker Hub repository

---

## Step 5: Push to Docker Hub

```bash
# Push the image
docker push YOUR_USERNAME/getting-started
```

**What happens?**
*   Docker uploads your image layers to Docker Hub
*   Anyone can now pull and run your image!

---

## Step 6: Run on Another Machine

```bash
# On ANY machine with Docker installed
docker run -d -p 3000:3000 YOUR_USERNAME/getting-started
```

*   Docker automatically **pulls** the image from Docker Hub
*   No need to have the source code!

---

## Visual: Push and Pull

![Docker Hub Flow](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyM5OWNjZmYnLCAnc2Vjb25kYXJ5Q29sb3InOiAnI2ZmY2MwMCcsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIEFbTG9jYWwgSW1hZ2VdIC0tICJkb2NrZXIgcHVzaCIgLS0+IEJbRG9ja2VyIEh1Yl0KICAgIEIgLS0gImRvY2tlciBwdWxsIiAtLT4gQ1tPdGhlciBNYWNoaW5lXQogICAgQyAtLT4gRFtSdW4gQ29udGFpbmVyXQogICAgCiAgICBzdHlsZSBBIGZpbGw6Izk5Y2NmZixzdHJva2U6IzMzMwogICAgc3R5bGUgQiBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEMgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBEIGZpbGw6Izk5ZmY5OSxzdHJva2U6IzMzMw==)


---


# Part 4: Persist the DB

---

## The Problem

*   Add some todo items to your app
*   Stop and remove the container
*   Start a new container
*   **Result**: Your todos are GONE! 😱

**Why?** Container filesystems are **ephemeral** (temporary)

---

## Understanding Container Filesystem

*   Each container has its own isolated filesystem
*   When you **delete** a container, its data is **lost**
*   **Solution**: Use **Volumes** to persist data

---

## What is a Volume?

*   A special directory that exists **outside** the container
*   Managed by Docker
*   Data survives container deletion
*   Can be shared between containers

---

## Visual: Container vs Volume Storage

![Volume Storage](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZjk5OTknLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5ZmY5OScsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggVEQKICAgIHN1YmdyYXBoICJXaXRob3V0IFZvbHVtZSIKICAgICAgICBBW0NvbnRhaW5lcl0gLS0+IEJbRGF0YSBpbnNpZGVdCiAgICAgICAgQiAtLT4gQ1siZGVsZXRlIGNvbnRhaW5lciA9IERhdGEgTE9TVCJdCiAgICBlbmQKICAgIAogICAgc3ViZ3JhcGggIldpdGggVm9sdW1lIgogICAgICAgIERbQ29udGFpbmVyXSAtLT4gRVtWb2x1bWVdCiAgICAgICAgRSAtLT4gRlsiZGVsZXRlIGNvbnRhaW5lciA9IERhdGEgU0FGRSJdCiAgICBlbmQKICAgIAogICAgc3R5bGUgQyBmaWxsOiNmZjk5OTksc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEYgZmlsbDojOTlmZjk5LHN0cm9rZTojMzMz)

---

## Step 1: Create a Volume

```bash
# Create a named volume
docker volume create todo-db
```

*   This creates a volume called `todo-db`
*   Docker manages where it's stored on your host

---

## Step 2: Run Container with Volume

```bash
# Stop and remove old container first
docker rm -f <container-id>

# Run with volume mounted
docker run -d -p 3000:3000 \
  -v todo-db:/etc/todos \
  getting-started
```

**What's `-v todo-db:/etc/todos`?**
*   Mount the `todo-db` volume to `/etc/todos` inside the container
*   The app stores its database at `/etc/todos`

---

## Step 3: Test Persistence

1. Add some todo items
2. Stop and remove the container:
   ```bash
   docker rm -f <container-id>
   ```
3. Start a new container with the same volume:
   ```bash
   docker run -d -p 3000:3000 -v todo-db:/etc/todos getting-started
   ```
4. **Check**: Your todos are still there! ✅

---

## Inspect the Volume

```bash
# List all volumes
docker volume ls

# Inspect volume details
docker volume inspect todo-db
```

**Output shows**:
*   Where Docker stores the data on your host
*   Volume metadata


---


# Part 5: Use Bind Mounts

---

## Volumes vs Bind Mounts

| Feature | Volumes | Bind Mounts |
|---------|---------|-------------|
| **Managed by** | Docker | You (manual path) |
| **Location** | Docker's storage | Any path on host |
| **Best for** | Production data | Development (live code) |
| **Example** | Database storage | Source code editing |

---

## Why Bind Mounts for Development?

*   **Problem**: Every code change requires rebuilding the image
*   **Solution**: Mount your source code directly into the container
*   **Result**: Edit code → See changes instantly (no rebuild!)

---

## Visual: Bind Mount Concept

![Bind Mount](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIEFbIkhvc3Q6IC9teS1wcm9qZWN0L3NyYyJdIC0tICJCaW5kIE1vdW50IiAtLT4gQlsiQ29udGFpbmVyOiAvYXBwL3NyYyJdCiAgICBCIC0tPiBDWyJDaGFuZ2VzIHN5bmMgaW5zdGFudGx5Il0KICAgIAogICAgc3R5bGUgQSBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEIgZmlsbDojOTljY2ZmLHN0cm9rZTojMzMzCiAgICBzdHlsZSBDIGZpbGw6Izk5ZmY5OSxzdHJva2U6IzMzMw==)

---

## Step 1: Run with Bind Mount

```bash
# Run container with bind mount
docker run -d -p 3000:3000 \
  -v "$(pwd):/app" \
  -v /app/node_modules \
  getting-started
```

**Explanation**:
*   `-v "$(pwd):/app"` = Mount current directory to `/app` in container
*   `-v /app/node_modules` = Prevent overwriting node_modules (keep container's version)

---

## Step 2: Enable Live Reload

For Node.js apps, use `nodemon` to watch for changes:

Update your `package.json`:
```json
{
  "scripts": {
    "dev": "nodemon src/index.js"
  }
}
```

Run with:
```bash
docker run -d -p 3000:3000 \
  -v "$(pwd):/app" \
  -v /app/node_modules \
  getting-started \
  npm run dev
```

---

## Step 3: Test Live Reload

1. Edit `src/static/js/app.js`
2. Save the file
3. **Refresh browser** → Changes appear instantly!
4. No need to rebuild or restart container


---


# Part 6: Multi-Container Apps

---

## The Challenge

*   Our app currently uses SQLite (file-based database)
*   **Better approach**: Use MySQL in a separate container
*   **Why separate?**
    *   Scale independently
    *   Update database without touching app
    *   Follow microservices best practices

---

## Container Networking

*   Containers are **isolated** by default
*   To communicate, they need to be on the same **network**
*   Docker provides built-in networking

---

## Visual: Multi-Container Architecture

![Multi-Container](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyM5OWNjZmYnLCAnc2Vjb25kYXJ5Q29sb3InOiAnI2ZmY2MwMCcsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIHN1YmdyYXBoICJEb2NrZXIgTmV0d29yayIKICAgICAgICBBW1RvZG8gQXBwIENvbnRhaW5lcl0gLS0gIlNRTCIgLS0+IEJbTXlTUUwgQ29udGFpbmVyXQogICAgZW5kCiAgICBDW1VzZXJdIC0tICJIVFRQIiAtLT4gQQogICAgCiAgICBzdHlsZSBBIGZpbGw6Izk5Y2NmZixzdHJva2U6IzMzMwogICAgc3R5bGUgQiBmaWxsOiNmZmNjMDAsc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEMgZmlsbDojOTlmZjk5LHN0cm9rZTojMzMz)

---

## Step 1: Create a Network

```bash
# Create a custom network
docker network create todo-app
```

*   Containers on this network can talk to each other
*   They can use container names as hostnames

---

## Step 2: Start MySQL Container

```bash
docker run -d \
  --network todo-app \
  --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:8.0
```

**Breakdown**:
*   `--network todo-app` = Join the network
*   `--network-alias mysql` = Other containers can reach it as "mysql"
*   `-v todo-mysql-data:/var/lib/mysql` = Persist database data
*   `-e MYSQL_ROOT_PASSWORD=secret` = Set root password
*   `-e MYSQL_DATABASE=todos` = Create "todos" database

---

## Step 3: Connect App to MySQL

```bash
docker run -d -p 3000:3000 \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  getting-started
```

**Environment variables**:
*   `MYSQL_HOST=mysql` = Connect to the "mysql" container
*   App automatically uses MySQL instead of SQLite

---

## Step 4: Verify Connection

```bash
# Check MySQL logs
docker logs <mysql-container-id>

# You should see connection from the app
```

**Test**: Add todos in the app → They're stored in MySQL!


---


# Part 7: Use Docker Compose

---

## The Problem

*   Running multi-container apps requires many commands
*   Hard to remember all the flags and options
*   **Solution**: Docker Compose

---

## What is Docker Compose?

*   A tool for defining multi-container apps
*   Uses a YAML file (`docker-compose.yml`)
*   Start everything with one command: `docker compose up`
*   Stop everything with: `docker compose down`

---

## Step 1: Create docker-compose.yml

Create `docker-compose.yml` in your project root:

```yaml
services:
  app:
    image: getting-started
    ports:
      - 3000:3000
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
    depends_on:
      - mysql

  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
    volumes:
      - todo-mysql-data:/var/lib/mysql

volumes:
  todo-mysql-data:
```

---

## Understanding the Compose File

**Services** = Containers to run
*   `app`: Your todo application
*   `mysql`: MySQL database

**Key features**:
*   `ports`: Port mapping
*   `environment`: Environment variables
*   `depends_on`: Start order (mysql before app)
*   `volumes`: Named volumes for persistence

**Docker Compose automatically creates a network!**

---

## Step 2: Start the Application Stack

```bash
# Start all services
docker compose up -d
```

**What happens?**
*   Docker Compose creates a network
*   Starts MySQL container
*   Starts app container
*   All with one command!

---

## Step 3: View Running Services

```bash
# List running services
docker compose ps

# View logs
docker compose logs -f

# View logs for specific service
docker compose logs -f app
```

---

## Step 4: Stop Everything

```bash
# Stop all services (keeps volumes)
docker compose down

# Stop and remove volumes
docker compose down --volumes
```

*   One command stops and removes all containers
*   Networks are automatically cleaned up

---

## Visual: Docker Compose Workflow

![Docker Compose](https://mermaid.ink/svg/JSV7aW5pdDogeyd0aGVtZSc6ICdiYXNlJywgJ3RoZW1lVmFyaWFibGVzJzogeyAncHJpbWFyeUNvbG9yJzogJyNmZmNjMDAnLCAnc2Vjb25kYXJ5Q29sb3InOiAnIzk5Y2NmZicsICd0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnfX19JSUKZ3JhcGggTFIKICAgIEFbZG9ja2VyLWNvbXBvc2UueW1sXSAtLSAiZG9ja2VyIGNvbXBvc2UgdXAiIC0tPiBCW0NyZWF0ZSBOZXR3b3JrXQogICAgQiAtLT4gQ1tTdGFydCBNeVNRTF0KICAgIEMgLS0+IERbU3RhcnQgQXBwXQogICAgRCAtLT4gRVtBbGwgUnVubmluZ10KICAgIEUgLS0gImRvY2tlciBjb21wb3NlIGRvd24iIC0tPiBGW1N0b3AgQWxsXQogICAgCiAgICBzdHlsZSBBIGZpbGw6I2ZmY2MwMCxzdHJva2U6IzMzMwogICAgc3R5bGUgRSBmaWxsOiM5OWZmOTksc3Ryb2tlOiMzMzMKICAgIHN0eWxlIEYgZmlsbDojZjk2LHN0cm9rZTojMzMz)

---

## Bonus: Development with Compose

Add bind mount for development:

```yaml
services:
  app:
    build: .  # Build from Dockerfile
    ports:
      - 3000:3000
    volumes:
      - ./:/app  # Bind mount for live reload
      - /app/node_modules
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
    command: npm run dev
    depends_on:
      - mysql
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
    volumes:
      - todo-mysql-data:/var/lib/mysql
volumes:
  todo-mysql-data:
```



---

## Challenge

build your first docker image , run it and push it to docker hub
and share it with us 


---


# **Questions?**

🐳 Happy Dockering!
