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

@WebServlet(name = "FetchDeveloperDetails", urlPatterns = {"/FetchDeveloperDetails"})
public class FetchDeveloperDetails extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT *, Roles.Name as RoleName FROM Developers INNER JOIN Roles ON Developers.RoleId = Roles.Id");
               ResultSet data = stmt.executeQuery();

               List<DevelopersGS> developerDetails = new ArrayList<>();
               while (data.next()) {
                    DevelopersGS developerData = new DevelopersGS();
                    developerData.setId(data.getInt("Id"));
                    developerData.setDeveloperName(data.getString("DeveloperName"));
                    developerData.setDeveloperPassword(data.getString("DeveloperPassword"));
                    developerData.setNumber(data.getString("Number"));
                    developerData.setProfilePhoto(data.getString("ProfilePhoto"));
                    developerData.setDeveloperEmail(data.getString("DeveloperEmail"));
                    developerData.setRoleId(data.getInt("RoleId"));
                    developerData.setRoleName(data.getString("RoleName"));
                    developerData.setBirthDate(data.getString("BirthDate"));
                    developerData.setAge(data.getString("Age"));
                    developerData.setGender(data.getString("Gender"));
                    developerData.setCountry(data.getString("Country"));
                    developerData.setState(data.getString("State"));
                    developerData.setGithub(data.getString("Github"));
                    developerData.setInstagram(data.getString("Instagram"));
                    developerData.setTwitter(data.getString("Twitter"));
                    developerData.setFacebook(data.getString("Facebook"));
                    developerData.setDateOfJoining(data.getString("DateOfJoining"));
                    developerData.setAbout(data.getString("About"));
                    developerData.setCaption(data.getString("Caption"));
                    developerData.setSalary(data.getString("Salary"));
                    developerData.setStatus(data.getString("Status"));
                    developerDetails.add(developerData);
               }

               String json = new Gson().toJson(developerDetails);
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
