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

@WebServlet(name = "AddClient", urlPatterns = {"/AddClient"})
public class AddClient extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String name = request.getParameter("name");
          String number = request.getParameter("number");
          String address = request.getParameter("address");
          String country = request.getParameter("country");
          String state = request.getParameter("state");
          String projectId = request.getParameter("projectId");
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement(
                       "INSERT INTO Clients (ClientName, Number, Address, State, Country, ProjectId) VALUES (?,?,?,?,?,?)");
               query.setString(1, name);
               query.setString(2, number);
               query.setString(3, address);
               query.setString(4, state);
               query.setString(5, country);
               query.setString(6, projectId);
               query.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }

}
