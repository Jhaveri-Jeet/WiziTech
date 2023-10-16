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

@WebServlet(name = "DeleteProject", urlPatterns = {"/DeleteProject"})
public class DeleteProject extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          int id = Integer.parseInt(request.getParameter("id"));
          PrintWriter out = response.getWriter();

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement deleteProject = con.prepareStatement("DELETE FROM Projects WHERE Id = ?");
               PreparedStatement deleteTask = con.prepareStatement("DELETE FROM Task WHERE ProjectId = ?");
               PreparedStatement deleteClient = con.prepareStatement("DELETE FROM Clients WHERE ProjectId = ?");
               deleteProject.setInt(1, id);
               deleteTask.setInt(1, id);
               deleteClient.setInt(1, id);
               
               deleteClient.executeUpdate();
               deleteTask.executeUpdate();
               deleteProject.executeUpdate();
          } catch (SQLException ex) {
               out.print(ex);
          }
     }
}
