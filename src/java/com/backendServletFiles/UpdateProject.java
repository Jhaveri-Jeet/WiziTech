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

@WebServlet(name = "UpdateProject", urlPatterns = {"/UpdateProject"})
@MultipartConfig
public class UpdateProject extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          int id = Integer.parseInt(request.getParameter("id"));
          String projectTitle = request.getParameter("projectTitle");
          String projectDescription = request.getParameter("projectDescription");
          String projectRequirement = request.getParameter("projectRequirement");
          String amount = request.getParameter("amount");
          String amountStatus = request.getParameter("amountStatus");
          String dateOfTaken = request.getParameter("dateOfTaken");
          String dateOfStarted = request.getParameter("dateOfStarted");
          String dateOfCompletion = request.getParameter("dateOfCompletion");
          String projectProgress = request.getParameter("projectProgress");
          String frontendTechnology = request.getParameter("frontendTechnology");
          String backendTechnology = request.getParameter("backendTechnology");
          String databaseName = request.getParameter("databaseName");
          int developmentId = Integer.parseInt(request.getParameter("developmentId"));
          String url = request.getParameter("url");
          String warranty = request.getParameter("warranty");
          String status = request.getParameter("status");

          try {

               Part imagePart = request.getPart("image");
               String fileName = imagePart.getSubmittedFileName();
               String confirmFileName = "";
               if (fileName == null) {
                    confirmFileName = request.getParameter("oldLogo");
               } else {
                    confirmFileName = fileName;
               }

               String uploadPath = getServletContext().getRealPath("/") + "assets/uploads/project-logo/" + fileName;
               imagePart.write(uploadPath);

               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("UPDATE Projects SET ProjectTitle = ?, ProjectDescription = ?, ProjectRequirements = ?, Logo = ?, Amount = ?, AmountStatus = ?, DateOfTaken = ?, DateOfStarted = ?, DateOfCompletion = ?, ProjectProgress = ? , FrontendTechnology = ?, BackendTechnology = ?, DatabaseName = ?, DevelopmentId = ?, Url = ?, Warranty = ?, Status = ? WHERE Id = ?");
               query.setString(1, projectTitle);
               query.setString(2, projectDescription);
               query.setString(3, projectRequirement);
               query.setString(4, confirmFileName);
               query.setString(5, amount);
               query.setString(6, amountStatus);
               query.setString(7, dateOfTaken);
               query.setString(8, dateOfStarted);
               query.setString(9, dateOfCompletion);
               query.setString(10, projectProgress);
               query.setString(11, frontendTechnology);
               query.setString(12, backendTechnology);
               query.setString(13, databaseName);
               query.setInt(14, developmentId);
               query.setString(15, url);
               query.setString(16, warranty);
               query.setString(17, status);
               query.setInt(18, id);
               query.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }

}
