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


@WebServlet(name = "FetchRoleName", urlPatterns = {"/FetchRoleName"})
public class FetchRoleName extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT * FROM Roles");
               ResultSet data = stmt.executeQuery();

               List<RolesGS> rolesNames = new ArrayList<>();
               while (data.next()) {
                    RolesGS rolesData = new RolesGS();
                    rolesData.setId(data.getInt("Id"));
                    rolesData.setName(data.getString("Name"));
                    rolesNames.add(rolesData);
               }

               String json = new Gson().toJson(rolesNames);
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
