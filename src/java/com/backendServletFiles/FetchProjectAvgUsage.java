package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchProjectAvgUsage", urlPatterns = {"/FetchProjectAvgUsage"})
public class FetchProjectAvgUsage extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();

          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT D.Name AS Technology, COUNT(P.Id) AS ProjectCount, COUNT(P.Id) / (SELECT COUNT(*) FROM Projects) * 100 AS AvgUsage FROM Development D LEFT JOIN Projects P ON D.Id = P.DevelopmentId GROUP BY D.Name ORDER BY AvgUsage DESC");
               ResultSet totalProjectAvgUsage = stmt.executeQuery();

               while (totalProjectAvgUsage.next()) {
                    out.print("<!-- Your HTML code for each project -->");
                    out.print("<li class=\"mb-1\">");
                    out.print("    <div class=\"row\">");
                    out.print("        <div class=\"col-sm-3\">");
                    out.print("            <p class=\"mb-0\">" + totalProjectAvgUsage.getString("Technology") + "</p>");
                    out.print("        </div>");
                    out.print("        <div class=\"col-sm-6\">");
                    out.print("            <div class=\"d-flex align-items-center justify-content-between\">");
                    out.print("                <div class=\"iq-progress-bar bg-primary-light\">");
                    out.print("                    <span class=\"bg-primary iq-progress-primary\" data-percent=\"" + totalProjectAvgUsage.getInt("AvgUsage") + "\"></span>");
                    out.print("                </div>");
                    out.print("                <span class=\"ml-3\">" + totalProjectAvgUsage.getInt("AvgUsage") + "%</span>");
                    out.print("            </div>");
                    out.print("        </div>");
                    out.print("    </div>");
                    out.print("</li>");
                    out.print("<br />");
                    out.print("<!-- End of HTML code for each project -->");
               }
          } catch (SQLException ex) {
               out.print(ex.getMessage());
          }

     }

}
