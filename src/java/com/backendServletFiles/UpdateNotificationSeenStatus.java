package com.backendServletFiles;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateNotificationSeenStatus", urlPatterns = {"/UpdateNotificationSeenStatus"})
public class UpdateNotificationSeenStatus extends HttpServlet {
       @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          HttpSession session = request.getSession();
          String userId = (String) session.getAttribute("userId");
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("Update Task SET Notification = ? WHERE DeveloperId = ?");
               stmt.setString(1, "Seen");
               stmt.setString(2, userId);
               stmt.executeUpdate();

               con.close();
               stmt.close();

          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
     }
}
