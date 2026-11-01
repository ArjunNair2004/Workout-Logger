package com.workout.servlet;

import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/WorkoutServlet")
public class WorkoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        String sql = "INSERT INTO logs (user_id, day_of_week, workout_split, protein_intake, gym_time, duration_minutes) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, (int) session.getAttribute("userId"));
            stmt.setString(2, request.getParameter("day"));
            stmt.setString(3, request.getParameter("split"));
            stmt.setInt(4, Integer.parseInt(request.getParameter("protein")));
            stmt.setString(5, request.getParameter("gymTime"));
            stmt.setInt(6, Integer.parseInt(request.getParameter("duration")));
            stmt.executeUpdate();
            response.sendRedirect("DashboardServlet");
        } catch (Exception e) { e.printStackTrace(); }
    }
}