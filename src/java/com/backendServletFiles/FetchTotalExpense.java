package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchTotalExpense", urlPatterns = {"/FetchTotalExpense"})
public class FetchTotalExpense extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement expenseStmt = con.prepareStatement("select ((select sum(Amount) from Expenses)+(select sum(Salary) from Developers) ) as TotalExpense");
               ResultSet TotalExpense = expenseStmt.executeQuery();

               while (TotalExpense.next()) {
                    out.print(TotalExpense.getInt("TotalExpense"));
               }
          } catch (SQLException ex) {
               out.print(ex.getMessage());
          }

     }

}
