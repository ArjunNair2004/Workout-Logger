Markdown
# 🏋️‍♂️ Workout & Nutrition Logger

A dynamic, full-stack enterprise Java web application designed to help users systematically track their daily fitness routines, gym timings, workout duration, and nutritional intake. Built using the **Model-View-Controller (MVC)** architecture with a modern, responsive **Glassmorphism** UI.

## 🌟 Features

* **Comprehensive Tracking:** Log the day of the week, target muscle group (split), time of gym entry, workout duration (minutes), and daily protein intake.
* **Modern Glassmorphism UI:** A sleek, translucent frosted-glass aesthetic built with custom CSS and Bootstrap 5 over a vibrant gradient background.
* **Automated Timestamps:** The database automatically records the exact date and time each log is created.
* **Dynamic Rendering:** Uses JSTL and Expression Language (EL) to securely render database information onto the UI without deprecated Java scriptlets.
* **Interactive UI Feedback:** Features sliding flash messages (success/error alerts) based on user actions.
* **Full CRUD Functionality:** Users can seamlessly Create, Read, and Delete workout records.

## 🛠️ Tech Stack

* **Frontend:** HTML5, CSS3 (Backdrop-filter for Glassmorphism), Bootstrap 5, JSP (Jakarta Server Pages), JSTL, Expression Language.
* **Backend:** Java 17+, Jakarta Servlets (Enterprise Java).
* **Database:** MySQL relational database accessed via JDBC (Java Database Connectivity).
* **Server:** Apache Tomcat 10+

## 📋 Prerequisites

To run this project locally, you will need:
* **Java Development Kit (JDK):** Version 17 or higher.
* **IDE:** Eclipse IDE for Enterprise Java and Web Developers.
* **Web Server:** Apache Tomcat v10.0+.
* **Database:** MySQL Server and MySQL Workbench.
* **Required JAR Files:** `mysql-connector-j` (for database connection) and `jakarta.servlet.jsp.jstl-api`/`jstl-impl` (for JSTL tags).

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone [https://github.com/ArjunNair2004/Workout-Logger.git](https://github.com/ArjunNair2004/Workout-Logger.git)
2. Database Configuration
Open MySQL Workbench or your SQL command line and execute the following queries to set up the database and table:

SQL
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
3. Configure the Project in Eclipse
Open Eclipse and select File > Open Projects from File System... and select the cloned repository folder.

Ensure the required JAR files (mysql-connector, jstl) are present in the src/main/webapp/WEB-INF/lib directory.

Open src/main/java/com/workout/DBConnection.java.

Update the DB_PASSWORD variable with your actual MySQL root password:

Java
private static final String DB_PASSWORD = "your_actual_password_here"; 
4. Run the Application
Add the project to your Apache Tomcat Server in Eclipse.

Right-click the server and click Start.

Open your browser and navigate to:
http://localhost:8080/WorkoutLogger/index.jsp

📂 Project Architecture (MVC)
Model: WorkoutLog.java (Java Bean representing the data structure) & DBConnection.java (Centralized database configuration).

View: index.jsp (Data entry form) & summary.jsp (History dashboard).

Controller: WorkoutServlet.java, ViewServlet.java, and DeleteServlet.java handle HTTP requests, input validation, and database routing.

📸 Screenshots

<img width="1917" height="971" alt="image" src="https://github.com/user-attachments/assets/af20d3f5-40ab-4255-9e11-9652a4f19685" />

<img width="1917" height="980" alt="image" src="https://github.com/user-attachments/assets/980b775d-8b50-47ba-8aa9-81abe5e574b6" />
