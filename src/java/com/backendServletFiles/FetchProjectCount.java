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

@WebServlet(name = "FetchProjectCount", urlPatterns = {"/FetchProjectCount"})
public class FetchProjectCount extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT COUNT(Projects.Id) as PendingProjectCount FROM Projects WHERE Projects.Status = 'Pending'");
               ResultSet pending = stmt.executeQuery();
               PreparedStatement workingstmt = con.prepareStatement("SELECT COUNT(Projects.Id) as WorkingProjectCount FROM Projects WHERE Projects.Status = 'Working'");
               ResultSet working = workingstmt.executeQuery();
               PreparedStatement completedstmt = con.prepareStatement("SELECT COUNT(Projects.Id) as CompletedProjectCount FROM Projects WHERE Projects.Status = 'Completed'");
               ResultSet completed = completedstmt.executeQuery();

               List<ProjectsGS> projectCountDetails = new ArrayList<>();
               ProjectsGS projectCountData = new ProjectsGS();
               
               while (pending.next()) {
                    projectCountData.setPendingProjectCount(pending.getInt("PendingProjectCount"));
                    projectCountDetails.add(projectCountData);
               }
               while (working.next()) {
                    projectCountData.setWorkingProjectCount(working.getInt("WorkingProjectCount"));
                    projectCountDetails.add(projectCountData);
               }
               while (completed.next()) {
                    projectCountData.setCompletedProjectCount(completed.getInt("CompletedProjectCount"));
                    projectCountDetails.add(projectCountData);
               }

               String json = new Gson().toJson(projectCountDetails);
               response.setContentType("application/json");
               response.setCharacterEncoding("UTF-8");
               out.print(json);

               con.close();
               stmt.close();
               pending.close();
               working.close();
               completed.close();

          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
     }
}
