package com.workout.servlet;

import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sql = "INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, request.getParameter("username"));
            stmt.setString(2, request.getParameter("email"));
            stmt.setString(3, request.getParameter("password"));
            stmt.executeUpdate();
            response.sendRedirect("login.jsp?success=registered");
        } catch (SQLIntegrityConstraintViolationException e) {
            response.sendRedirect("register.jsp?error=exists");
        } catch (Exception e) { e.printStackTrace(); }
    }
}