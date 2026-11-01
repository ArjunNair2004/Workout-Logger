package com.workout.servlet;

import com.workout.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM logs WHERE id=? AND user_id=?")) {
            stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
            stmt.setInt(2, (int) session.getAttribute("userId"));
            stmt.executeUpdate();
            response.sendRedirect("DashboardServlet");
        } catch (Exception e) { e.printStackTrace(); }
    }
}