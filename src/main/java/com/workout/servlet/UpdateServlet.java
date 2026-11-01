package com.workout.servlet;

import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        String sql = "UPDATE logs SET day_of_week=?, workout_split=?, gym_time=?, duration_minutes=?, protein_intake=? WHERE id=? AND user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, request.getParameter("day"));
            stmt.setString(2, request.getParameter("split"));
            stmt.setString(3, request.getParameter("gymTime"));
            stmt.setInt(4, Integer.parseInt(request.getParameter("duration")));
            stmt.setInt(5, Integer.parseInt(request.getParameter("protein")));
            stmt.setInt(6, Integer.parseInt(request.getParameter("id")));
            stmt.setInt(7, (int) session.getAttribute("userId"));
            stmt.executeUpdate();
            response.sendRedirect("DashboardServlet");
        } catch (Exception e) { e.printStackTrace(); }
    }
}