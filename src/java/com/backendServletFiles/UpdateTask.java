package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateTask", urlPatterns = {"/UpdateTask"})
public class UpdateTask extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String task = request.getParameter("task");
          String dueDate = request.getParameter("dueDate");
          String description = request.getParameter("description");
          int projectId = Integer.parseInt(request.getParameter("projectId"));
          int developerId = Integer.parseInt(request.getParameter("developerId"));
          String status = request.getParameter("status");
          int id = Integer.parseInt(request.getParameter("id"));
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("UPDATE Task SET Task = ?, DueDate = ?, Description = ?, ProjectId = ?, DeveloperId = ?, Status = ? WHERE Id = ?");
               query.setString(1, task);
               query.setString(2, dueDate);
               query.setString(3, description);
               query.setInt(4, projectId);
               query.setInt(5, developerId);
               query.setString(6, status);
               query.setInt(7, id);
               query.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }
}
