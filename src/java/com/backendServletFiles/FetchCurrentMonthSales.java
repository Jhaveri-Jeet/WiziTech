package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchCurrentMonthSales", urlPatterns = {"/FetchCurrentMonthSales"})
public class FetchCurrentMonthSales extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT SUM(Amount) as TotalSalesOfMonth FROM `Projects` WHERE MONTH(DateOfTaken) = MONTH(CURDATE())");
               ResultSet TotalSalesOfMonth = stmt.executeQuery();
               while (TotalSalesOfMonth.next()) {
                    out.print(TotalSalesOfMonth.getInt("TotalSalesOfMonth"));
               }
          } catch (SQLException ex) {
               out.print(ex.getMessage());
          }
     }
}
