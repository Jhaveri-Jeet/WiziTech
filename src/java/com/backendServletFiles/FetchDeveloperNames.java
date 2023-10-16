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

@WebServlet(name = "FetchDeveloperNames", urlPatterns = {"/FetchDeveloperNames"})
public class FetchDeveloperNames extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT Id, DeveloperName, Status FROM Developers");
               ResultSet data = stmt.executeQuery();

               List<DevelopersGS> developerNames = new ArrayList<>();
               while (data.next()) {
                    DevelopersGS developerData = new DevelopersGS();
                    developerData.setId(data.getInt("Id"));
                    developerData.setDeveloperName(data.getString("DeveloperName"));
                    developerData.setStatus(data.getString("Status"));
                    developerNames.add(developerData);
               }

               String json = new Gson().toJson(developerNames);
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
