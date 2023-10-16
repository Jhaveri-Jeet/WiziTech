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

@WebServlet(name = "UpdateDeveloper", urlPatterns = {"/UpdateDeveloper"})
@MultipartConfig
public class UpdateDeveloper extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String id = request.getParameter("id");
          String developerName = request.getParameter("developerName");
          String developerPassword = request.getParameter("developerPassword");
          String number = request.getParameter("number");
          String developerEmail = request.getParameter("developerEmail");
          String birthDate = request.getParameter("birthDate");
          String age = request.getParameter("age");
          String country = request.getParameter("country");
          String state = request.getParameter("state");
          String github = request.getParameter("github");
          String instagram = request.getParameter("instagram");
          String twitter = request.getParameter("twitter");
          String facebook = request.getParameter("facebook");
          String about = request.getParameter("about");
          String caption = request.getParameter("caption");

          try {

               //               Profile Image Location Change
               Part imagePart = request.getPart("image");
               String fileName = imagePart.getSubmittedFileName();
               String confirmFileName = "";
               if (fileName == null) {
                    confirmFileName = request.getParameter("oldImage");
               } else {
                    confirmFileName = fileName;
               }

               String uploadPath = getServletContext().getRealPath("/") + "assets/uploads/developer-profile-photo/" + fileName;
               imagePart.write(uploadPath);

               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement query = con.prepareStatement("UPDATE Developers SET DeveloperName = ?, DeveloperPassword = ?, Number = ?, ProfilePhoto = ?, DeveloperEmail = ?, BirthDate = ?, Age = ?,Country = ?, State = ?, Github = ?, Instagram = ?, Twitter = ?, Facebook = ?, About = ?, Caption = ? WHERE Id = ?");
               query.setString(1, developerName);
               query.setString(2, developerPassword);
               query.setString(3, number);
               query.setString(4, confirmFileName);
               query.setString(5, developerEmail);
               query.setString(6, birthDate);
               query.setString(7, age);
               query.setString(8, country);
               query.setString(9, state);
               query.setString(10, github);
               query.setString(11, instagram);
               query.setString(12, twitter);
               query.setString(13, facebook);
               query.setString(14, about);
               query.setString(15, caption);
               query.setString(16, id);
               query.executeUpdate();

          } catch (SQLException ex) {
               out.print(ex);
          }
     }

}
