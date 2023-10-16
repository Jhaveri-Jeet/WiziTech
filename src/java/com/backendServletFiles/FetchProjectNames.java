package com.backendServletFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.List;

@WebServlet(name = "FetchProjectNames", urlPatterns = {"/FetchProjectNames"})
public class FetchProjectNames extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT Id, ProjectTitle FROM Projects");
               ResultSet data = stmt.executeQuery();
               
               List<ProjectsGS> projectNames = new ArrayList<>();
               while (data.next()) {
                    ProjectsGS projectData = new ProjectsGS();
                    projectData.setId(data.getInt("Id"));
                    projectData.setProjectTitle(data.getString("ProjectTitle"));
                    projectNames.add(projectData);
               }
               
               String json = new Gson().toJson(projectNames);
               response.setContentType("application/json");
               response.setCharacterEncoding("UTF-8");
               out.print(json);

               con.close();
               stmt.close();
               data.close();
               
          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
     }
}
