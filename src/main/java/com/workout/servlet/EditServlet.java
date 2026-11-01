package com.workout.servlet;

import com.workout.model.WorkoutLog;
import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM logs WHERE id=? AND user_id=?")) {
            stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
            stmt.setInt(2, (int) session.getAttribute("userId"));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                WorkoutLog log = new WorkoutLog();
                log.setId(rs.getInt("id"));
                log.setDayOfWeek(rs.getString("day_of_week"));
                log.setWorkoutSplit(rs.getString("workout_split"));
                log.setGymTime(rs.getString("gym_time"));
                log.setDurationMinutes(rs.getInt("duration_minutes"));
                log.setProteinIntake(rs.getInt("protein_intake"));
                request.setAttribute("log", log);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else { response.sendRedirect("DashboardServlet"); }
        } catch (Exception e) { e.printStackTrace(); }
    }
}