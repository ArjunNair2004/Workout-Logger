package com.workout.servlet;

import com.workout.model.WorkoutLog;
import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        ArrayList<WorkoutLog> logs = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM logs WHERE user_id=? ORDER BY id DESC")) {
            stmt.setInt(1, (int) session.getAttribute("userId"));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                WorkoutLog log = new WorkoutLog();
                log.setId(rs.getInt("id"));
                log.setDayOfWeek(rs.getString("day_of_week"));
                log.setWorkoutSplit(rs.getString("workout_split"));
                log.setProteinIntake(rs.getInt("protein_intake"));
                log.setGymTime(rs.getString("gym_time"));
                log.setDurationMinutes(rs.getInt("duration_minutes"));
                logs.add(log);
            }
            request.setAttribute("logsList", logs);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace(); }
    }
}