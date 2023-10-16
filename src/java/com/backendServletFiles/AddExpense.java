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

@WebServlet(name = "AddExpense", urlPatterns = {"/AddExpense"})
public class AddExpense extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String name = request.getParameter("name");
          int amount = Integer.parseInt(request.getParameter("amount"));
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("INSERT INTO Expenses (Expense, Amount) VALUES (?,?)");
               query.setString(1, name);
               query.setInt(2, amount);
               query.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }

}
