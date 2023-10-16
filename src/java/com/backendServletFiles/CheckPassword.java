package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckPassword", urlPatterns = { "/CheckPassword" })
public class CheckPassword extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {

          HttpSession session = request.getSession();
          String userId = (String) session.getAttribute("userId");
          String userName = (String) session.getAttribute("userName");
          String password = request.getParameter("password");
          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");

               // Owner Checking
               if (userName.equals("Owner")) {
                    PreparedStatement stmt = con
                              .prepareStatement("SELECT * FROM Owner WHERE OwnerPassword = ? AND Id = ?");
                    stmt.setString(1, password);
                    stmt.setString(2, userId);
                    ResultSet data = stmt.executeQuery();
                    if (data.next()) {
                         out.print(data.next());
                         RequestDispatcher redirect = request.getRequestDispatcher("/index.jsp");
                         redirect.forward(request, response);
                    } else {
                         out.print(data.next());
                    }
                    stmt.close();
                    data.close();
               } // Developer Checking
               else {
                    PreparedStatement stmt = con
                              .prepareStatement("SELECT * FROM Developers WHERE DeveloperPassword = ? AND Id = ?");
                    stmt.setString(1, password);
                    stmt.setString(2, userId);
                    ResultSet data = stmt.executeQuery();

                    PreparedStatement updatestmt = con
                              .prepareStatement("Update Developers SET Status = ? WHERE Id = ?");
                    updatestmt.setString(1, "Online");
                    updatestmt.setString(2, userId);
                    if (data.next()) {
                         out.print(data.next());
                         RequestDispatcher redirect = request.getRequestDispatcher("/pages/page-project.jsp");
                         redirect.forward(request, response);
                         updatestmt.executeUpdate();
                    } else {
                         out.print(data.next());
                    }
                    stmt.close();
                    data.close();
               }
               con.close();
               response.setContentType("application/html");

          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
     }
}
