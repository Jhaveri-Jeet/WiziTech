package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          HttpSession session = request.getSession();
          String userId = (String) session.getAttribute("userId");
          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement updatestmt = con.prepareStatement("Update Developers SET Status = ? WHERE Id = ?");
               updatestmt.setString(1, "Offline");
               updatestmt.setString(2, userId);
               updatestmt.executeUpdate();

          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
          session.invalidate();
          RequestDispatcher redirect = request.getRequestDispatcher("pages/username.jsp");
          redirect.forward(request, response);
     }

}
