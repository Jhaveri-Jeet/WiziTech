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

@WebServlet(name = "FetchProjectDetails", urlPatterns = {"/FetchProjectDetails"})
public class FetchProjectDetails extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT *, Projects.Id as ProjectId FROM Projects INNER JOIN Development ON Projects.DevelopmentId = Development.Id ORDER BY Projects.Id DESC;");
               ResultSet data = stmt.executeQuery();

               List<ProjectsGS> projectDetails = new ArrayList<>();
               while (data.next()) {
                    ProjectsGS projectData = new ProjectsGS();
                    projectData.setId(data.getInt("ProjectId"));
                    projectData.setProjectTitle(data.getString("ProjectTitle"));
                    projectData.setProjectDescription(data.getString("ProjectDescription"));
                    projectData.setProjectRequirements(data.getString("ProjectRequirements"));
                    projectData.setDateOfStarted(data.getString("DateOfStarted"));
                    projectData.setDateOfTaken(data.getString("DateOfTaken"));
                    projectData.setStatus(data.getString("Status"));
                    projectData.setLogo(data.getString("Logo"));
                    projectData.setUrl(data.getString("Url"));
                    projectData.setWarranty(data.getInt("Warranty"));
                    projectData.setAmount(data.getInt("Amount"));
                    projectData.setFrontendTechnology(data.getString("FrontendTechnology"));
                    projectData.setBackendTechnology(data.getString("BackendTechnology"));
                    projectData.setDatabaseName(data.getString("DatabaseName"));
                    projectData.setProjectProgress(data.getInt("ProjectProgress"));
                    projectData.setAmountStatus(data.getString("AmountStatus"));
                    projectData.setDevelopmentName(data.getString("Name"));
                    projectData.setProjectProgress(data.getInt("ProjectProgress"));
                    projectDetails.add(projectData);
               }

               String json = new Gson().toJson(projectDetails);
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
