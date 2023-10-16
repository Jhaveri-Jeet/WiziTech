package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchProfilePhoto", urlPatterns = {"/FetchProfilePhoto"})
public class FetchProfilePhoto extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          String id = request.getParameter("id");
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT ProfilePhoto FROM Developers WHERE Id = ?");
               stmt.setString(1, id);
               ResultSet data = stmt.executeQuery();
               while (data.next()) {
                    out.println(data.getString("ProfilePhoto"));
               }

          } catch (SQLException ex) {
               System.out.println(ex.getMessage());
          }
     }
}
