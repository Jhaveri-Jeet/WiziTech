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

@WebServlet(name = "AddTask", urlPatterns = {"/AddTask"})
public class AddTask extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String task = request.getParameter("task");
          String dueDate = request.getParameter("dueDate");
          String description = request.getParameter("description");
          int projectId = Integer.parseInt(request.getParameter("projectId"));
          int developerId = Integer.parseInt(request.getParameter("developerId"));

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("INSERT INTO Task (Task, DueDate, Description, ProjectId, DeveloperId) VALUES (?,?,?,?,?)");
               query.setString(1, task);
               query.setString(2, dueDate);
               query.setString(3, description);
               query.setInt(4, projectId);
               query.setInt(5, developerId);
               query.executeUpdate();
               
               PreparedStatement updateProjectStatus = con.prepareStatement("UPDATE Projects SET Status = ? WHERE Id = ?");
               updateProjectStatus.setString(1, "Working");
               updateProjectStatus.setInt(2,projectId);
               updateProjectStatus.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }
}
