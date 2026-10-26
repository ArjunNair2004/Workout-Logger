<div align="center">

# 🏋️‍♂️ Workout & Nutrition Logger

**A full-stack Jakarta EE web application for tracking daily workouts, gym timings, workout duration and protein intake.**

![Java](https://img.shields.io/badge/Java-17%2B-orange?logo=openjdk&logoColor=white)
![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-Servlets%20%7C%20JSP%20%7C%20JSTL-blue)
![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-10%2B-yellow?logo=apachetomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-JDBC-4479A1?logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?logo=bootstrap&logoColor=white)

</div>

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Screenshots](#-screenshots)
- [Features](#-features)
- [Tech Stack](#️-tech-stack)
- [Architecture (MVC)](#-architecture-mvc)
- [Project Structure](#-project-structure)
- [Database Schema](#️-database-schema)
- [Prerequisites](#-prerequisites)
- [Installation & Setup](#-installation--setup)
- [Usage](#-usage)
- [Configuration](#️-configuration)
- [Troubleshooting](#-troubleshooting)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🔎 Overview

**Workout & Nutrition Logger** helps you systematically track your fitness routine. For every gym session you can record the day of the week, the muscle group you trained (your workout split), the time you entered the gym, how long you trained, and how much protein you consumed that day.

The application follows the classic **Model-View-Controller (MVC)** pattern using Jakarta Servlets and JSP, persists data in a **MySQL** database through **JDBC**, and presents everything in a responsive **Glassmorphism** interface built with custom CSS and Bootstrap 5.

---

## 📸 Screenshots

| Entry Form (Front Page) | History Dashboard (Result Page) |
|:---:|:---:|
| ![Front Page](<Workout Logger Front Page.png>) | ![Result Page](<Workout Logger Result Page.png>) |

---

## 🌟 Features

- **Comprehensive tracking** – log the day of the week, target muscle group (split), gym entry time, workout duration (in minutes) and daily protein intake.
- **Modern Glassmorphism UI** – a translucent, frosted-glass look created with `backdrop-filter` and Bootstrap 5 over a vibrant gradient background.
- **Automatic timestamps** – the database records the exact date and time each log is created.
- **Dynamic rendering** – JSTL and Expression Language (EL) render database content on the page without deprecated Java scriptlets.
- **Interactive feedback** – sliding flash messages (success / error alerts) respond to user actions.
- **Core CRUD operations** – create, read and delete workout records.
- **Server-side validation** – servlets validate input before it reaches the database.

---

## 🛠️ Tech Stack

| Layer | Technologies |
|---|---|
| **Frontend** | HTML5, CSS3 (`backdrop-filter`), Bootstrap 5, JSP (Jakarta Server Pages), JSTL, Expression Language |
| **Backend** | Java 17+, Jakarta Servlets |
| **Database** | MySQL, accessed via JDBC |
| **Server** | Apache Tomcat 10+ |
| **IDE** | Eclipse IDE for Enterprise Java and Web Developers |

---

## 🧱 Architecture (MVC)

```
        ┌──────────────┐   HTTP request    ┌─────────────────────────┐
        │   Browser    │ ────────────────► │  Controller (Servlets)  │
        │ (JSP views)  │                   │ WorkoutServlet          │
        │              │ ◄──────────────── │ ViewServlet             │
        └──────────────┘   rendered JSP    │ DeleteServlet           │
               ▲                            └───────────┬─────────────┘
               │                                        │ JDBC
               │                            ┌───────────▼─────────────┐
               └─────── forwards data ───── │  Model                  │
                                            │ WorkoutLog.java (bean)  │
                                            │ DBConnection.java       │
                                            └───────────┬─────────────┘
                                                        │
                                                ┌───────▼───────┐
                                                │  MySQL (logs) │
                                                └───────────────┘
```

| Role | Component | Responsibility |
|---|---|---|
| **Model** | `WorkoutLog.java` | Java Bean representing a single workout log entry |
| **Model** | `DBConnection.java` | Centralised database connection configuration |
| **View** | `index.jsp` | Data-entry form |
| **View** | `summary.jsp` | History dashboard listing saved logs |
| **Controller** | `WorkoutServlet.java` | Handles form submission, validates input and saves a log |
| **Controller** | `ViewServlet.java` | Fetches saved logs and forwards them to the dashboard |
| **Controller** | `DeleteServlet.java` | Removes a selected log entry |

---

## 📂 Project Structure

> Based on the components documented in the project. Exact sub-folders may differ slightly.

```
Workout-Logger/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/workout/
│       │       ├── DBConnection.java      # DB configuration (edit password here)
│       │       ├── WorkoutLog.java        # Model / Java Bean
│       │       ├── WorkoutServlet.java    # Controller – create
│       │       ├── ViewServlet.java       # Controller – read
│       │       └── DeleteServlet.java     # Controller – delete
│       └── webapp/
│           ├── index.jsp                  # Entry form
│           ├── summary.jsp                # History dashboard
│           └── WEB-INF/
│               └── lib/                   # mysql-connector-j, JSTL JARs
├── Workout Logger Front Page.png          # Screenshot
├── Workout Logger Result Page.png         # Screenshot
├── .gitignore
└── README.md
```

---

## 🗄️ Database Schema

The application uses a single table, `logs`, inside the `workout_db` database.

| Column | Type | Constraints | Description |
|---|---|---|---|
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique ID for each log |
| `day_of_week` | `VARCHAR(20)` | `NOT NULL` | Day of the workout (e.g. Monday) |
| `workout_split` | `VARCHAR(50)` | `NOT NULL` | Muscle group / split trained (e.g. Chest) |
| `protein_intake` | `INT` | `NOT NULL` | Protein consumed that day (grams) |
| `gym_time` | `VARCHAR(10)` | `NOT NULL` | Time of gym entry (e.g. 18:30) |
| `duration_minutes` | `INT` | `NOT NULL` | Workout duration in minutes |
| `created_at` | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP` | Auto-recorded creation time |

---

## 📋 Prerequisites

| Requirement | Version / Notes |
|---|---|
| **JDK** | 17 or higher |
| **IDE** | Eclipse IDE for Enterprise Java and Web Developers |
| **Web server** | Apache Tomcat **10.0+** (required for the `jakarta.*` namespace) |
| **Database** | MySQL Server and MySQL Workbench |
| **JAR files** | `mysql-connector-j` and `jakarta.servlet.jsp.jstl-api` / `jstl-impl` |
| **Git** | To clone the repository |

> ⚠️ **Tomcat 9 and earlier will not work.** They use the older `javax.*` namespace, while this project uses `jakarta.*`.

---

## 🚀 Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/ArjunNair2004/Workout-Logger.git
cd Workout-Logger
```

### 2. Create the database

Open MySQL Workbench (or the MySQL command line) and run:

```sql
CREATE DATABASE workout_db;
USE workout_db;

CREATE TABLE logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    day_of_week VARCHAR(20) NOT NULL,
    workout_split VARCHAR(50) NOT NULL,
    protein_intake INT NOT NULL,
    gym_time VARCHAR(10) NOT NULL,
    duration_minutes INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3. Import the project into Eclipse

1. Open Eclipse and choose **File → Open Projects from File System…**
2. Select the cloned `Workout-Logger` folder and finish the import.
3. Make sure these JARs are present in `src/main/webapp/WEB-INF/lib`:
   - `mysql-connector-j`
   - `jakarta.servlet.jsp.jstl-api`
   - `jakarta.servlet.jsp.jstl` (JSTL implementation)

### 4. Configure the database password

Open `src/main/java/com/workout/DBConnection.java` and update the password to match your MySQL root account:

```java
private static final String DB_PASSWORD = "your_actual_password_here";
```

### 5. Run the application

1. Add the project to your **Apache Tomcat 10+** server in Eclipse (**Servers → Add and Remove…**).
2. Right-click the server and choose **Start**.
3. Open your browser and go to:

```
http://localhost:8080/WorkoutLogger/index.jsp
```

---

## 💡 Usage

1. **Add a log** – on the front page, choose the day, enter your workout split, gym entry time, duration (minutes) and protein intake, then submit.
2. **View history** – after saving, you are taken to the dashboard, which lists your logged sessions with their timestamps.
3. **Delete a log** – remove any entry from the dashboard; a flash message confirms the result.

---

## ⚙️ Configuration

| Setting | Location | Default / Example |
|---|---|---|
| Database name | `DBConnection.java` | `workout_db` |
| Database user | `DBConnection.java` | `root` |
| Database password | `DBConnection.java` | *set your own* |
| Context path | Eclipse / Tomcat deployment | `WorkoutLogger` |
| Port | Tomcat `server.xml` | `8080` |

> 🔐 **Security tip:** avoid committing real credentials. Consider moving database settings into environment variables or a properties file that is excluded via `.gitignore`.

---

## 🧯 Troubleshooting

| Problem | Likely cause | Fix |
|---|---|---|
| `ClassNotFoundException: com.mysql.cj.jdbc.Driver` | MySQL connector JAR missing | Add `mysql-connector-j` to `WEB-INF/lib` and refresh/clean the project |
| `HTTP 404` on `/WorkoutLogger/index.jsp` | Wrong context path or project not deployed | Check the deployed context path in the Tomcat server settings |
| Servlets or JSP tags fail with `javax.*` / `jakarta.*` errors | Tomcat version is below 10 | Use Apache Tomcat 10.0 or later |
| JSTL tags are printed as plain text | JSTL JARs missing or taglib URI mismatch | Add the Jakarta JSTL API and implementation JARs to `WEB-INF/lib` |
| `Access denied for user 'root'@'localhost'` | Incorrect DB password | Update `DB_PASSWORD` in `DBConnection.java` |
| `Unknown database 'workout_db'` | Database not created | Run the SQL script in the setup section |
| `Communications link failure` | MySQL server not running | Start the MySQL service and confirm it listens on port 3306 |

---

## 🗺️ Roadmap

Ideas for future improvements:

- [ ] Edit / update existing workout logs
- [ ] User accounts and authentication
- [ ] Charts for protein intake and workout duration over time
- [ ] Filter and search logs by day or muscle group
- [ ] Weekly and monthly summaries
- [ ] Connection pooling (e.g. HikariCP) and externalised configuration
- [ ] Docker Compose setup for Tomcat + MySQL
- [ ] Export logs to CSV

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📄 License

No license has been specified for this repository yet. Add a `LICENSE` file (for example MIT) to define how others may use the code.

---

## 👤 Author

**Arjun Nair** – [@ArjunNair2004](https://github.com/ArjunNair2004)

If you found this project useful, consider giving it a ⭐ on GitHub!
