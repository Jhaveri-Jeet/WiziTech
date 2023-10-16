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

@WebServlet(name = "DeleteRole", urlPatterns = {"/DeleteRole"})
public class DeleteRole extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          int id = Integer.parseInt(request.getParameter("id"));
          PrintWriter out = response.getWriter();

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement delete = con.prepareStatement("DELETE FROM Roles WHERE Id = ?");
               delete.setInt(1, id);
               delete.executeUpdate();
          } catch (SQLException ex) {
               out.print(ex);
          }
     }

}
