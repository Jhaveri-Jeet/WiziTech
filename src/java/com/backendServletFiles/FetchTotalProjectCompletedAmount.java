package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchTotalProjectCompletedAmount", urlPatterns = {"/FetchTotalProjectCompletedAmount"})
public class FetchTotalProjectCompletedAmount extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT SUM(Amount) as TotalProjectCompletedAmount FROM `Projects` WHERE Status = 'Completed'");
               ResultSet totalCompletedAmount = stmt.executeQuery();

               while (totalCompletedAmount.next()) {
                    out.print(totalCompletedAmount.getInt("TotalProjectCompletedAmount"));
               }
          } catch (SQLException ex) {
               out.print(ex.getMessage());
          }
     }
}
