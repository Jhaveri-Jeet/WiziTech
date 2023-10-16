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
import javax.servlet.http.HttpSession;

@WebServlet(name = "TaskStatusToStop", urlPatterns = {"/TaskStatusToStop"})
public class TaskStatusToStop extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");

          HttpSession session = request.getSession();
          String userId = (String) session.getAttribute("userId");
          PrintWriter out = response.getWriter();
          
          int id = Integer.parseInt(request.getParameter("id"));
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("UPDATE Task SET Status = ? WHERE Id = ?");
               query.setString(1, "NotWorking");
               query.setInt(2, id);
               query.executeUpdate();

               PreparedStatement Developerquery = con.prepareStatement("UPDATE Developers SET Status = ? WHERE Id = ?");
               Developerquery.setString(1, "Online");
               Developerquery.setString(2, userId);
               Developerquery.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }
}
