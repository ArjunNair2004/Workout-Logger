package com.workout.servlet;

import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sql = "SELECT * FROM users WHERE email=? AND password_hash=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, request.getParameter("email"));
            stmt.setString(2, request.getParameter("password"));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("user_id"));
                session.setAttribute("userName", rs.getString("username"));
                response.sendRedirect("DashboardServlet");
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}