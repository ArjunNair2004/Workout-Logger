<div align="center">

# 🏋️‍♂️ Workout & Nutrition Logger

**A full-stack Jakarta EE web application for tracking daily workouts, gym timings, workout duration and protein intake, with full create, view, edit and delete support.**

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
- [Future Scope](#-future-scope)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🔎 Overview

**Workout & Nutrition Logger** helps you systematically track your fitness routine. For every gym session you can record the day of the week, the muscle group you trained (your workout split), the time you entered the gym, how long you trained, and how much protein you consumed that day.

Made a mistake or want to update a session? Each saved record has an **Edit** button that opens a dedicated edit page, so you can correct a log without deleting and re-entering it.

The application follows the classic **Model-View-Controller (MVC)** pattern using Jakarta Servlets and JSP, persists data in a **MySQL** database through **JDBC**, and presents everything in a responsive **Glassmorphism** interface built with custom CSS and Bootstrap 5.

---

## 📸 Screenshots

| Entry Form (Front Page) | History Dashboard (Result Page) | Edit Page |
|:---:|:---:|:---:|
| ![Front Page](<Workout Logger Front Page.png>) | ![Result Page](<Workout Logger Result Page.png>) | ![Edit Page](<Workout Logger Edit Page.png>) |

---

## 🌟 Features

- **Comprehensive tracking** – log your name, the day of the week, target muscle group (split), gym entry time, workout duration (in minutes) and daily protein intake (in grams).
- **✏️ Edit records** – every entry on the history dashboard has an **Edit** button that opens an **Edit Workout** page, pre-filled with the saved values. Change any field and press **Update Log** to save, or **Cancel** to go back without changing anything.
- **Full CRUD functionality** – **C**reate, **R**ead, **U**pdate and **D**elete workout records.
- **Modern Glassmorphism UI** – a translucent, frosted-glass look created with `backdrop-filter` and Bootstrap 5 over a vibrant gradient background.
- **Automatic timestamps** – the database records the exact date and time each log is created.
- **Dynamic rendering** – JSTL and Expression Language (EL) render database content on the page without deprecated Java scriptlets.
- **Interactive feedback** – sliding flash messages (success / error alerts) respond to user actions.
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
        │ (JSP views)  │                   │ WorkoutServlet  (create)│
        │              │ ◄──────────────── │ ViewServlet     (read)  │
        └──────────────┘   rendered JSP    │ Edit servlet    (update)│
               ▲                            │ DeleteServlet   (delete)│
               │                            └───────────┬─────────────┘
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
| **View** | `summary.jsp` | History dashboard listing saved logs, with Edit and Delete buttons |
| **View** | Edit page (JSP) | Pre-filled form for updating an existing log <!-- TODO: add the exact file name, e.g. `edit.jsp` --> |
| **Controller** | `WorkoutServlet.java` | Handles form submission, validates input and saves a log |
| **Controller** | `ViewServlet.java` | Fetches saved logs and forwards them to the dashboard |
| **Controller** | Edit servlet | Loads the selected record into the edit page and saves the updated values <!-- TODO: add the exact file name, e.g. `EditServlet.java` --> |
| **Controller** | `DeleteServlet.java` | Removes a selected log entry |

---

## 📂 Project Structure

> Based on the components documented in the project. Exact sub-folders and the names of the edit files may differ slightly.

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
│       │       ├── <Edit servlet>.java    # Controller – update
│       │       └── DeleteServlet.java     # Controller – delete
│       └── webapp/
│           ├── index.jsp                  # Entry form
│           ├── summary.jsp                # History dashboard
│           ├── <edit page>.jsp            # Edit form for an existing log
│           └── WEB-INF/
│               └── lib/                   # mysql-connector-j, JSTL JARs
├── Workout Logger Front Page.png          # Screenshot – entry form
├── Workout Logger Result Page.png         # Screenshot – history dashboard
├── Workout Logger Edit Page.png           # Screenshot – edit page
├── .gitignore
└── README.md
```

---

## 🗄️ Database Schema

The application uses a single table, `logs`, inside the `workout_db` database.

| Column | Type | Constraints | Description |
|---|---|---|---|
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique ID for each log (used to find the record being edited or deleted) |
| `<name column>` | `VARCHAR(...)` | `NOT NULL` | The "Your Name" value entered on the form <!-- TODO: replace with your real column name and type, and add it to the CREATE TABLE script below --> |
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
    -- TODO: add your "Your Name" column here (e.g. user_name VARCHAR(50) NOT NULL),
    -- matching the column used in your servlets
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
3. **Edit a log** – click the **Edit** button next to an entry. The **Edit Workout** page opens with that record's current values (name, day of the week, workout split, gym time, duration and protein intake). Change what you need and click **Update Log** to save, or **Cancel** to discard your changes. After saving, you are returned to the dashboard.
4. **Delete a log** – remove any entry from the dashboard; a flash message confirms the result.

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
| Edit page opens empty or shows a 404 after clicking **Edit** | Project not redeployed after the latest changes | Clean the project, republish it to Tomcat and restart the server |
| Edits don't save | Wrong or missing record `id` being sent | Confirm the edit form passes the log's `id` to the edit servlet |

---

## 🔮 Future Scope

- **🔐 User Authentication** – Add persistent sessions and distinct user accounts, with a unique login history for each user.
- **📊 Data Visualization** – Use a charting library such as Chart.js to show weekly protein intake trends and how consistent your workout times are.
- **🛡️ Improved Security** – Stronger input validation and strong password policies for a fully secure system.
- **🧠 Predictive Analytics & ML** – An AI-driven recommendation engine that analyzes past workout logs to suggest optimized workout splits and protein intake adjustments based on your progress.
- **📤 Data Portability & Export** – Generate downloadable CSV or PDF reports (e.g. with iText for PDF or Apache POI for Excel) to share your history with personal trainers or dietitians.
- **🥗 External Nutrition APIs & Meal Generation** – Connect to databases like USDA FoodData Central or Edamam to calculate exact macros from text meal inputs instead of manual protein estimates. An LLM (LangChain + Groq) can then generate custom recipes from your remaining daily macros and available ingredients.
- **🤖 Personalized AI Coach** – A conversational coach built with LangChain, ChromaDB and RAG that uses tool-calling to query your workout, diet and biometric records for personalized coaching, technique tips and motivation.
- **📏 Biometric Analytics & Dynamic Workout Splits** – Track height, weight and auto-calculated BMI, and generate adaptive weekly splits that support progressive overload and recovery.
- **☁️ Cloud Containerization & Deployment** – Move from a local Apache Tomcat setup to a scalable cloud environment by containerizing the MVC app with Docker (plus MySQL via Docker Compose) and deploying it on AWS or Google Cloud.
- **🧩 Smaller improvements** – Filter and search logs by day or muscle group, weekly and monthly summaries, and connection pooling (e.g. HikariCP) with externalized configuration.

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
