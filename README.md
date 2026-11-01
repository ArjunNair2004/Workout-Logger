<div align="center">

# 🏋️‍♂️ Workout & Nutrition Logger

**A secure, full-stack Jakarta EE web application for tracking daily workouts, gym timings, workout duration and protein intake, with individual user accounts and full create, view, edit and delete support.**

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
- [Application Flow](#-application-flow)
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

The app now has a **secure login and sign-up system**. Each user has an individual account and a password-protected session, replacing the original open-access approach. Anyone without an active session is automatically redirected to the login page.

Made a mistake? Each saved record has an **Edit** button that opens a dedicated edit page, so you can correct a log without deleting and re-entering it.

The application follows the classic **Model-View-Controller (MVC)** pattern using Jakarta Servlets and JSP, persists data in a **MySQL** database through **JDBC**, and presents everything in a responsive, **animated Glassmorphism** interface built with custom CSS and Bootstrap 5.

---

## 📸 Screenshots

### 🔐 Authentication

| Login | Sign Up |
|:---:|:---:|
| ![Login Page](<Workout Logger Login Page.png>) | ![Register Page](<Workout Logger Register Page.png>) |

### 📋 Workout Tracking

| Dashboard | Log Workout |
|:---:|:---:|
| ![Dashboard](<Workout Logger Dashboard Page.png>) | ![Log Workout](<Workout Logger Log Workout Page.png>) |

### ✏️ Editing

| Edit Workout |
|:---:|
| ![Edit Page](<Workout Logger Edit Page.png>) |


---

## 🌟 Features

- **🔐 User authentication & session management** – sign up with a username, email and password, then log in with your email and password. Every user has an individual, password-protected account, and pages are guarded: if a session is missing, the user is automatically redirected.
- **👋 Personalized dashboard** – a welcome header with your username, a **+ Log Workout** button, a **Logout** button, and a card for each saved workout showing the day, split, gym time, duration and a protein badge, with **Edit** and **Delete** buttons.
- **Comprehensive tracking** – log the day of the week, target muscle group (split), gym entry time, workout duration (in minutes) and daily protein intake (in grams).
- **✏️ Edit records** – every entry on the dashboard has an **Edit** button that opens an **Edit Workout** page, pre-filled with the saved values. Change any field and press **Update Log** to save, or **Cancel** to go back without changing anything.
- **Full CRUD functionality** – **C**reate, **R**ead, **U**pdate and **D**elete workout records.
- **✨ Animated Glassmorphism UI** – a dynamic, high-energy layout with an animated mesh-gradient background (`linear-gradient` + `@keyframes gradientBG`), frosted-glass input fields with glowing focus states, and vibrant hover-animated buttons (`btn-pop`).
- **Guided navigation & error handling** – a welcome-file configuration in `web.xml` routes users through login, the dashboard summary, record creation and editing, with automatic redirects when a session is missing.
- **Automatic timestamps** – the database records the exact date and time each log is created.
- **Dynamic rendering** – JSTL and Expression Language (EL) render database content on the page without deprecated Java scriptlets.
- **Interactive feedback** – sliding flash messages (success / error alerts) respond to user actions.
- **Server-side validation** – servlets validate input before it reaches the database.

---

## 🛠️ Tech Stack

| Layer | Technologies |
|---|---|
| **Frontend** | HTML5, CSS3 (`backdrop-filter`, CSS keyframe animations), Bootstrap 5, JSP (Jakarta Server Pages), JSTL, Expression Language |
| **Backend** | Java 17+, Jakarta Servlets, HTTP sessions |
| **Database** | MySQL, accessed via JDBC |
| **Server** | Apache Tomcat 10+ |
| **Configuration** | `web.xml` deployment descriptor (welcome file, routing) |
| **IDE** | Eclipse IDE for Enterprise Java and Web Developers |

---

## 🧱 Architecture (MVC)

```
        ┌──────────────┐   HTTP request    ┌──────────────────────────┐
        │   Browser    │ ────────────────► │  Controller (Servlets)   │
        │ (JSP views)  │                   │ LoginServlet   (login)   │
        │              │                   │ RegisterServlet(sign-up) │
        │              │ ◄──────────────── │ WorkoutServlet (create)  │
        └──────────────┘   rendered JSP    │ ViewServlet    (read)    │
               ▲                            │ Edit servlet   (update)  │
               │                            │ DeleteServlet  (delete)  │
               │                            └────────────┬─────────────┘
               │                                         │ JDBC
               │                            ┌────────────▼─────────────┐
               └─────── forwards data ───── │  Model                   │
                                            │ WorkoutLog.java (bean)   │
                                            │ DBConnection.java        │
                                            └────────────┬─────────────┘
                                                         │
                                                 ┌───────▼────────┐
                                                 │     MySQL      │
                                                 │ users + logs   │
                                                 └────────────────┘
```

| Role | Component | Responsibility |
|---|---|---|
| **Model** | `WorkoutLog.java` | Java Bean representing a single workout log entry |
| **Model** | `DBConnection.java` | Centralised database connection configuration |
| **View** | `login.jsp` | Login page |
| **View** | `register.jsp` | Sign-up page for new users |
| **View** | `dashboard.jsp` | Dashboard summary of saved logs, with Edit and Delete buttons |
| **View** | `index.jsp` | Data-entry form for new records |
| **View** | `edit.jsp` | Pre-filled form for updating an existing log |
| **Controller** | `LoginServlet.java` | Authenticates the user and starts a session |
| **Controller** | `RegisterServlet.java` | Creates a new user account |
| **Controller** | `WorkoutServlet.java` | Handles form submission, validates input and saves a log |
| **Controller** | `ViewServlet.java` | Fetches saved logs and forwards them to the dashboard |
| **Controller** | Edit servlet | Loads the selected record into `edit.jsp` and saves the updated values <!-- TODO: add the exact file name, e.g. `EditServlet.java` --> |
| **Controller** | `DeleteServlet.java` | Removes a selected log entry |
| **Config** | `web.xml` | Welcome-file configuration and routing for the application |

---

## 🔀 Application Flow

```
        Open app
           │
           ▼
   ┌───────────────┐   no account    ┌───────────────┐
   │   login.jsp   │ ──────────────► │ register.jsp  │
   └───────┬───────┘ ◄────────────── └───────────────┘
           │ valid credentials             sign up
           ▼
   ┌───────────────┐   "Add workout"  ┌──────────────┐
   │ dashboard.jsp │ ───────────────► │  index.jsp   │
   │ (summary)     │ ◄─────────────── │ (new record) │
   └───────┬───────┘      saved       └──────────────┘
           │ "Edit"
           ▼
   ┌───────────────┐
   │   edit.jsp    │ ── Update Log / Cancel ──► back to dashboard
   └───────────────┘

   Any protected page without an active session ──► redirected to login
```

---

## 📂 Project Structure

> Based on the components documented in the project. Exact sub-folders and the edit servlet's file name may differ slightly.

```
Workout-Logger/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/workout/
│       │       ├── DBConnection.java      # DB configuration (edit password here)
│       │       ├── WorkoutLog.java        # Model / Java Bean
│       │       ├── LoginServlet.java      # Controller – login & session start
│       │       ├── RegisterServlet.java   # Controller – sign-up
│       │       ├── WorkoutServlet.java    # Controller – create
│       │       ├── ViewServlet.java       # Controller – read
│       │       ├── <Edit servlet>.java    # Controller – update
│       │       └── DeleteServlet.java     # Controller – delete
│       └── webapp/
│           ├── login.jsp                  # Login page
│           ├── register.jsp               # Sign-up page
│           ├── dashboard.jsp              # Dashboard summary
│           ├── index.jsp                  # Entry form
│           ├── edit.jsp                   # Edit form for an existing log
│           └── WEB-INF/
│               ├── web.xml                # Welcome file & routing configuration
│               └── lib/                   # mysql-connector-j, JSTL JARs
├── Workout Logger Login Page.png          # Screenshot – login
├── Workout Logger Register Page.png       # Screenshot – sign up
├── Workout Logger Dashboard Page.png      # Screenshot – dashboard
├── Workout Logger Log Workout Page.png    # Screenshot – new workout form
├── Workout Logger Edit Page.png           # Screenshot – edit workout
├── .gitignore
└── README.md
```

---

## 🗄️ Database Schema

The application uses the `workout_db` database. Workout records live in the `logs` table, and user accounts are stored for login and sign-up.

### `logs` table

| Column | Type | Constraints | Description |
|---|---|---|---|
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique ID for each log (used to find the record being edited or deleted) |
| `day_of_week` | `VARCHAR(20)` | `NOT NULL` | Day of the workout (e.g. Monday) |
| `workout_split` | `VARCHAR(50)` | `NOT NULL` | Muscle group / split trained (e.g. Chest) |
| `protein_intake` | `INT` | `NOT NULL` | Protein consumed that day (grams) |
| `gym_time` | `VARCHAR(10)` | `NOT NULL` | Time of gym entry (e.g. 18:30) |
| `duration_minutes` | `INT` | `NOT NULL` | Workout duration in minutes |
| `created_at` | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP` | Auto-recorded creation time |

### `users` table

<!-- TODO: replace the placeholder column names/types below with the exact ones from your users table, and add the user foreign-key column to `logs` if logs are linked to a user. -->

| Column | Description |
|---|---|
| `<id>` | Unique ID for each user account |
| `<username>` | Display name chosen at sign-up (shown in the dashboard greeting) |
| `<email>` | Email address used to log in |
| `<password>` | The user's password credential |

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

-- TODO: add your users table here (username, email, password), e.g.
-- CREATE TABLE users ( ... );

CREATE TABLE logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- TODO: add a user reference column here if your logs are linked to users
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
http://localhost:8080/WorkoutLogger/
```

The welcome-file configuration in `web.xml` guides you to the login page. Register a new account first if you don't have one.

---

## 💡 Usage

1. **Sign up** – on the login page, click **Sign up here**, choose a username, enter your email and create a password, then click **Sign Up**.
2. **Log in** – enter your email and password and click **Login to Logger** to start a password-protected session and land on your dashboard.
3. **Add a log** – click **+ Log Workout**, enter the day (e.g. Monday), split (e.g. Chest), gym time, duration (mins) and protein (g), then click **Save Log**, or **Cancel & Go Back** to leave without saving.
4. **View history** – the dashboard lists your logged sessions with their timestamps.
5. **Edit a log** – click **Edit** next to an entry. The **Edit Workout** page opens with the record's current values. Change what you need and click **Update Log**, or **Cancel** to discard your changes.
6. **Delete a log** – remove any entry from the dashboard; a flash message confirms the result.
7. **Log out** – click **Logout** in the dashboard header to end your session.

> 🔒 If your session expires or you open a protected page without logging in, you are redirected to the login page automatically.

---

## ⚙️ Configuration

| Setting | Location | Default / Example |
|---|---|---|
| Database name | `DBConnection.java` | `workout_db` |
| Database user | `DBConnection.java` | `root` |
| Database password | `DBConnection.java` | *set your own* |
| Welcome file / routing | `WEB-INF/web.xml` | Sends users to the login flow |
| Context path | Eclipse / Tomcat deployment | `WorkoutLogger` |
| Port | Tomcat `server.xml` | `8080` |

> 🔐 **Security tip:** avoid committing real credentials. Consider moving database settings into environment variables or a properties file that is excluded via `.gitignore`.

---

## 🧯 Troubleshooting

| Problem | Likely cause | Fix |
|---|---|---|
| `ClassNotFoundException: com.mysql.cj.jdbc.Driver` | MySQL connector JAR missing | Add `mysql-connector-j` to `WEB-INF/lib` and refresh/clean the project |
| `HTTP 404` on `/WorkoutLogger/` | Wrong context path or project not deployed | Check the deployed context path in the Tomcat server settings |
| Servlets or JSP tags fail with `javax.*` / `jakarta.*` errors | Tomcat version is below 10 | Use Apache Tomcat 10.0 or later |
| JSTL tags are printed as plain text | JSTL JARs missing or taglib URI mismatch | Add the Jakarta JSTL API and implementation JARs to `WEB-INF/lib` |
| `Access denied for user 'root'@'localhost'` | Incorrect DB password | Update `DB_PASSWORD` in `DBConnection.java` |
| `Unknown database 'workout_db'` | Database not created | Run the SQL script in the setup section |
| `Table '...users' doesn't exist` or sign-up fails | Users table not created | Run the SQL for the users table before registering |
| `Communications link failure` | MySQL server not running | Start the MySQL service and confirm it listens on port 3306 |
| Always redirected back to the login page | No active session, or cookies blocked | Log in again and make sure the browser accepts session cookies |
| Login fails for a new account | Account not registered yet | Create the account on the register page first |
| Edit page opens empty or shows a 404 after clicking **Edit** | Project not redeployed after the latest changes | Clean the project, republish it to Tomcat and restart the server |
| Edits don't save | Wrong or missing record `id` being sent | Confirm the edit form passes the log's `id` to the edit servlet |
| Old page or style still showing | Browser cache or stale deployment | Hard-refresh the browser (Ctrl + F5) and clean/republish the project |

---

## 🔮 Future Scope

- **🛡️ Improved Security** – Stronger input validation and strong password policies for a fully secure system.
- **📊 Data Visualization** – Use a charting library such as Chart.js to show weekly protein intake trends and how consistent your workout times are.
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
