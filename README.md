# 🩺 System Health Check Script

## 📘 Overview
`healthcheck.sh` is a simple Bash script designed to monitor system health.  
It checks and logs system metrics like uptime, CPU load, memory usage, disk usage, and top memory-consuming processes.  
It also verifies if key services (like **nginx** or **ssh**) are running.

The script saves all data with timestamps into `healthlog.txt`.

---

## ⚙️ Features
- 🕓 Displays **current date and time**
- ⏱ Shows **system uptime**
- 💻 Monitors **CPU load**
- 🧠 Reports **memory usage**
- 💾 Displays **disk usage**
- 🔝 Lists **top 5 memory-consuming processes**
- 🧩 Checks if specific **services** are running
- 📝 Logs output to **healthlog.txt**

---

## 🪟 Windows (Git Bash) Version
This version uses **PowerShell** commands under the hood, so it works on Windows systems with Git Bash installed.

---

## 🚀 How to Run

### Step 1: Clone this repo
```bash
git clone https://github.com/kilaruvenkatesh/system-health-check.git
