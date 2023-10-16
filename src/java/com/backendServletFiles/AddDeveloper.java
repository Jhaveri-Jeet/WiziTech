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
//import javax.servlet.http.Part;

@WebServlet(name = "AddDeveloper", urlPatterns = {"/AddDeveloper"})
@MultipartConfig
public class AddDeveloper extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();

          String name = request.getParameter("name");
          String password = request.getParameter("password");
          String number = request.getParameter("number");
          String email = request.getParameter("email");
          int roleId = Integer.parseInt(request.getParameter("roleId"));
          String birthDate = request.getParameter("birthDate");
          String age = request.getParameter("age");
          String gender = request.getParameter("gender");
          String country = request.getParameter("country");
          String state = request.getParameter("state");
          String dateOfJoining = request.getParameter("dateOfJoining");
          String salary = request.getParameter("salary");

          try {
               
////               Profile Image Location Change
//               Part imagePart = request.getPart("image");
//               String fileName = imagePart.getSubmittedFileName();
//
//               String uploadPath = getServletContext().getRealPath("/") + "assets/uploads/developer-profile-photo/" + fileName;
//               imagePart.write(uploadPath);
//               
//               
////               Banner Image Location Change
//               Part bannerImagePart = request.getPart("bannerImage");
//               String bannerFileName = bannerImagePart.getSubmittedFileName();
//
//               String uploadBannerPath = getServletContext().getRealPath("/") + "assets/uploads/developer-banner-photo/" + bannerFileName;
//               bannerImagePart.write(uploadBannerPath);

               // Perform database operations
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "")) {
                    String sql = "INSERT INTO Developers (DeveloperName, DeveloperPassword, Number, DeveloperEmail, RoleId, BirthDate, Age, Gender, Country, State, DateOfJoining, Salary) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
                    try (PreparedStatement query = con.prepareStatement(sql)) {
                         query.setString(1, name);
                         query.setString(2, password);
                         query.setString(3, number);
                         query.setString(4, email);
                         query.setInt(5, roleId);
                         query.setString(6, birthDate);
                         query.setString(7, age);
                         query.setString(8, gender);
                         query.setString(9, country);
                         query.setString(10, state);
                         query.setString(11, dateOfJoining);
                         query.setString(12, salary);
                         query.executeUpdate();
                    }
               }

//               response.getWriter().write("{\"status\": true, \"message\": \"Image uploaded successfully.\"}");
          } catch (SQLException ex) {
               response.getWriter().write("{\"status\": false, \"message\": \"Database error: " + ex.getMessage() + "\"}");
          } 
//          catch (IOException | ServletException ex) {
//               response.getWriter().write("{\"status\": false, \"message\": \"Error uploading image: " + ex.getMessage() + "\"}");
//          }
     }
}
