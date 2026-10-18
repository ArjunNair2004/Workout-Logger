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
        String day = request.getParameter("day");
        String split = request.getParameter("split");
        String proteinStr = request.getParameter("protein");
        String gymTime = request.getParameter("gymTime");
        String durationStr = request.getParameter("duration");

        try {
            int protein = Integer.parseInt(proteinStr);
            int duration = Integer.parseInt(durationStr);
            
            if (protein < 0 || duration < 0) throw new NumberFormatException();

            // Notice created_at is omitted here because MySQL generates it automatically
            String sql = "INSERT INTO logs (day_of_week, workout_split, protein_intake, gym_time, duration_minutes) VALUES (?, ?, ?, ?, ?)";
            
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                
                stmt.setString(1, day);
                stmt.setString(2, split);
                stmt.setInt(3, protein);
                stmt.setString(4, gymTime);
                stmt.setInt(5, duration);
                stmt.executeUpdate();
                
                request.getSession().setAttribute("msg", "Workout logged successfully!");
                request.getSession().setAttribute("msgType", "success");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Invalid numbers. Protein and Duration must be positive.");
            request.getSession().setAttribute("msgType", "error");
            response.sendRedirect("index.jsp");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("ViewServlet");
    }
}