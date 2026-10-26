package com.workout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        WorkoutLog log = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM logs WHERE id = ?")) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                log = new WorkoutLog();
                log.setId(rs.getInt("id"));
                log.setUserName(rs.getString("user_name"));
                log.setDayOfWeek(rs.getString("day_of_week"));
                log.setWorkoutSplit(rs.getString("workout_split"));
                log.setProteinIntake(rs.getInt("protein_intake"));
                log.setGymTime(rs.getString("gym_time"));
                log.setDurationMinutes(rs.getInt("duration_minutes"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("log", log);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }
}