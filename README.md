# 📦 Backup & Rotation Automation Script

A Bash-based automation tool to create backups of directories and manage them using a retention policy.

---

## 📌 Overview

This project automates:

* Directory backups using ZIP compression
* Backup rotation (retains only latest 5 backups)
* Cleanup of older backup files

It is designed for DevOps engineers to manage backups efficiently and prevent unnecessary disk usage.

---

## 🛠️ Tech Stack

* **Bash**
* **Linux Utilities** (`zip`, `ls`, `rm`, `cron`)

---

## ⚙️ Features

* 📦 Creates compressed backups of a directory
* 🗂️ Stores backups with timestamps
* 🔄 Retains only the latest 5 backups
* 🗑️ Automatically deletes older backups
* 🔐 Safe scripting with `set -euo pipefail`

---

## 📂 Project Structure

```
backup-rotation-script/
│
├── backup_rotation.sh
├── README.md
├── LICENSE
└── .gitignore
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/vishaldk18/backup-rotation-script.git
cd backup-rotation-script
```

---

### 2. Make Script Executable

```bash
chmod +x backup_rotation.sh
```

---

### 3. Run the Script

```bash
./backup_rotation.sh <source_dir> <backup_dir>
```

---

## 📊 Example

```bash
./backup_rotation.sh /var/www /backups
```

---

## 🔁 How Rotation Works

* Keeps **latest 5 backups**
* Deletes older backups automatically
* Backup naming format:

```
backup_YYYY-MM-DD-HH-MM-SS.zip
```

---

## ⏰ Automate with Cron

Run daily backup at 2 AM:

```bash
crontab -e
```

Add:

```bash
0 2 * * * /path/to/backup_rotation.sh /source /backup
```

---

## 🔐 Best Practices Used

* ✅ Input validation
* ✅ Directory validation and creation
* ✅ Safe scripting (`set -euo pipefail`)
* ✅ Efficient file handling using arrays

---

## 💡 Use Cases

* 🖥️ Server backup automation
* 📦 Application data backup
* 🔄 Retention-based storage management
* ⚙️ DevOps automation workflows

---

## 🚀 Future Enhancements

* 📩 Email/Slack notifications
* ☁️ Upload backups to AWS S3
* 📊 Backup size reporting
* ⚙️ Configurable retention policy

---

## 👨‍💻 Author

**Vishal Khairnar**
DevOps Engineer
📍 Pune, India

---

## 📄 License

This project is licensed under the **MIT License**.
