package com.workout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/WorkoutServlet")
public class WorkoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String day = request.getParameter("day");
        String split = request.getParameter("split");
        String gymTime = request.getParameter("gymTime");
        String durationStr = request.getParameter("duration");
        String proteinStr = request.getParameter("protein");

        try {
            int duration = Integer.parseInt(durationStr);
            int protein = Integer.parseInt(proteinStr);
            
            String sql = "INSERT INTO logs (user_name, day_of_week, workout_split, protein_intake, gym_time, duration_minutes) VALUES (?, ?, ?, ?, ?, ?)";
            
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                
                stmt.setString(1, userName);
                stmt.setString(2, day);
                stmt.setString(3, split);
                stmt.setInt(4, protein);
                stmt.setString(5, gymTime);
                stmt.setInt(6, duration);
                stmt.executeUpdate();
                
                request.getSession().setAttribute("msg", "Workout logged successfully!");
                request.getSession().setAttribute("msgType", "success");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("ViewServlet");
    }
}