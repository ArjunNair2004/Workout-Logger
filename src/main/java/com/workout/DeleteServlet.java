package com.workout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM logs WHERE id = ?")) {
                
                stmt.setInt(1, Integer.parseInt(id));
                stmt.executeUpdate();
                
                request.getSession().setAttribute("msg", "Log deleted.");
                request.getSession().setAttribute("msgType", "error"); // Red message
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("ViewServlet");
    }
}