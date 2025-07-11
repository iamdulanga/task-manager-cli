# 📝 Task Manager (Ruby CLI App)

A simple, beginner-friendly **Task Manager** built in **pure Ruby**. Manage your daily to-do list right from the command line with full support for adding, viewing, updating, deleting, and marking tasks as complete.

---

## ⚙️ Features

- ✅ Add a new task with title and description  
- 📋 View all tasks with completion status  
- ✏️ Update task title and/or description  
- ❌ Delete tasks by ID  
- 🔁 Toggle task completion  
- 💾 Persistent task storage in `tasks.json`

---

## 🧱 Tech Stack

- Language: [Ruby](https://www.ruby-lang.org/en/) (no frameworks)
- Storage: Local JSON file (`tasks.json`)
- Interface: Command-line (CLI)

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/ruby-task-manager.git
cd ruby-task-manager
````

### 2. Run the app

```bash
ruby task_manager.rb
```

That's it! The app will start in your terminal.

---

## 📂 File Structure

```
ruby-task-manager/
├── task.rb             # Task model class
├── task_manager.rb     # Main CLI logic
└── tasks.json          # Stores your tasks persistently (auto-created)
```

---

## 🧠 Concepts Covered

This project is designed to help you understand:

* Ruby OOP (Object-Oriented Programming)
* File I/O (reading/writing JSON)
* Simple CLI app structure
* Basic user input handling
* Local data persistence

---

## 🛠️ Future Improvements

* Add due dates or priorities
* Search/filter tasks
* Color output using `colorize` gem
* SQLite support for database storage
* Web version with Sinatra or Rails

---

## 📜 License

MIT License — free to use and modify.

---

## 👨‍💻 Author

Made by [Dulanga Dasanayake](https://github.com/iamdulanga) — contributions welcome!

