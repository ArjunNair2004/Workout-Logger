package com.workout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<WorkoutLog> logs = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM logs ORDER BY id DESC")) {
            
            while (rs.next()) {
                WorkoutLog log = new WorkoutLog();
                log.setId(rs.getInt("id"));
                log.setDayOfWeek(rs.getString("day_of_week"));
                log.setWorkoutSplit(rs.getString("workout_split"));
                log.setProteinIntake(rs.getInt("protein_intake"));
                log.setGymTime(rs.getString("gym_time"));
                log.setDurationMinutes(rs.getInt("duration_minutes"));
                
                // Trimming the .0 off the end of the SQL timestamp for a cleaner look
                String createdAt = rs.getString("created_at");
                if (createdAt != null && createdAt.endsWith(".0")) {
                    createdAt = createdAt.substring(0, createdAt.length() - 2);
                }
                log.setCreatedAt(createdAt);
                
                logs.add(log);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("logsList", logs);
        request.getRequestDispatcher("summary.jsp").forward(request, response);
    }
}