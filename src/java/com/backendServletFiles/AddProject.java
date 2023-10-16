package com.backendServletFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "AddProject", urlPatterns = {"/AddProject"})
@MultipartConfig
public class AddProject extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();

          String name = request.getParameter("name");
          String description = request.getParameter("description");
          String requirements = request.getParameter("requirements");
          String amount = request.getParameter("amount");
          String startingDate = request.getParameter("startingDate");
          String takenDate = request.getParameter("takenDate");
          String frontendTechnology = request.getParameter("frontendTechnology");
          String backendTechnology = request.getParameter("backendTechnology");
          String databaseName = request.getParameter("databaseName");
          String warranty = request.getParameter("warranty");
          String type = request.getParameter("type");

          try {
               Part imagePart = request.getPart("image");
               String fileName = imagePart.getSubmittedFileName();
               out.print(fileName);
               
               // Validate and sanitize the fileName if required
               String uploadPath = getServletContext().getRealPath("/") + "assets/uploads/project-logo/" + fileName;
               imagePart.write(uploadPath);
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "")) {
                    String sql = "INSERT INTO Projects (ProjectTitle, ProjectDescription, ProjectRequirements, Logo, Amount, DateOfTaken, DateOfStarted, FrontendTechnology, BackendTechnology, DatabaseName, DevelopmentId, Warranty) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
                    try (PreparedStatement query = con.prepareStatement(sql)) {
                         query.setString(1, name);
                         query.setString(2, description);
                         query.setString(3, requirements);
                         query.setString(4, fileName);
                         query.setString(5, amount);
                         query.setString(6, takenDate);
                         query.setString(7, startingDate);
                         query.setString(8, frontendTechnology);
                         query.setString(9, backendTechnology);
                         query.setString(10, databaseName);
                         query.setString(11, type);
                         query.setString(12, warranty);
                         query.executeUpdate();
                    }
               }

          } catch (SQLException ex) {
               response.getWriter().write("{\"status\": false, \"message\": \"Database error: " + ex.getMessage() + "\"}");
          } catch (IOException | ServletException ex) {
               response.getWriter().write("{\"status\": false, \"message\": \"Error uploading image: " + ex.getMessage() + "\"}");
          }
     }

}
