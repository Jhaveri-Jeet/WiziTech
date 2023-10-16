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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FetchProjectFullDetails", urlPatterns = {"/FetchProjectFullDetails"})
public class FetchProjectFullDetails extends HttpServlet {

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String id = request.getParameter("id");

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT *, Development.Name as developmentName FROM Projects INNER JOIN Clients ON Clients.ProjectId = Projects.Id INNER JOIN Development ON Development.Id = Projects.DevelopmentId WHERE Projects.Id = ?");
               stmt.setString(1, id);
               ResultSet data = stmt.executeQuery();

               List<ProjectsGS> projectDetails = new ArrayList<>();
               List<ClientsGS> clientDetails = new ArrayList<>();

               while (data.next()) {
                    ProjectsGS projectData = new ProjectsGS();
                    projectData.setId(data.getInt("Projects.Id"));
                    projectData.setProjectTitle(data.getString("ProjectTitle"));
                    projectData.setProjectDescription(data.getString("ProjectDescription"));
                    projectData.setProjectRequirements(data.getString("ProjectRequirements"));
                    projectData.setLogo(data.getString("Logo"));
                    projectData.setAmount(data.getInt("Amount"));
                    projectData.setAmountStatus(data.getString("AmountStatus"));
                    projectData.setDateOfTaken(data.getString("DateOfTaken"));
                    projectData.setDateOfStarted(data.getString("DateOfStarted"));
                    projectData.setDateOfCompletion(data.getString("DateOfCompletion"));
                    projectData.setProjectProgress(data.getInt("ProjectProgress"));
                    projectData.setFrontendTechnology(data.getString("FrontendTechnology"));
                    projectData.setBackendTechnology(data.getString("BackendTechnology"));
                    projectData.setDatabaseName(data.getString("DatabaseName"));
                    projectData.setDevelopmentId(data.getInt("DevelopmentId"));
                    projectData.setDevelopmentName(data.getString("developmentName"));
                    projectData.setUrl(data.getString("Url"));
                    projectData.setWarranty(data.getInt("Warranty"));
                    projectData.setStatus(data.getString("Status"));
                    projectDetails.add(projectData);

                    ClientsGS clientData = new ClientsGS();
                    clientData.setId(data.getInt("Clients.Id"));
                    clientData.setClientName(data.getString("ClientName"));
                    clientData.setClientNumber(data.getString("Number"));
                    clientData.setClientAddress(data.getString("Address"));
                    clientData.setClientState(data.getString("State"));
                    clientData.setClientCountry(data.getString("Country"));
                    clientDetails.add(clientData);
               }

               String jsonClient = new Gson().toJson(clientDetails);
               String jsonProject = new Gson().toJson(projectDetails);
               response.setContentType("application/json");
               response.setCharacterEncoding("UTF-8");

               con.close();
               stmt.close();
               data.close();

               request.setAttribute("projectDetails", projectDetails);
               request.setAttribute("clientDetails", clientDetails);

               // Forward the request to the page-project-view.jsp page
               RequestDispatcher dispatcher = request.getRequestDispatcher("./pages/page-project-view.jsp");
               dispatcher.forward(request, response);
          } catch (SQLException ex) {
               out.println(ex.getMessage());
          }
     }

}
