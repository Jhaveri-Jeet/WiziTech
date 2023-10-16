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

@WebServlet(name = "FetchClientDetails", urlPatterns = {"/FetchClientDetails"})
public class FetchClientDetails extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT Clients.Id, Clients.ClientName, Clients.Number, Clients.Address, Clients.State, Clients.Country, Projects.ProjectTitle, Projects.Url, Projects.Logo, Projects.Id as ProjectId FROM Clients INNER JOIN Projects ON Projects.Id = Clients.ProjectId");
               ResultSet data = stmt.executeQuery();

               List<ClientsGS> clientDetails = new ArrayList<>();
               while (data.next()) {
                    ClientsGS clientData = new ClientsGS();
                    clientData.setId(data.getInt("Id"));
                    clientData.setClientName(data.getString("ClientName"));
                    clientData.setClientNumber(data.getString("Number"));
                    clientData.setClientAddress(data.getString("Address"));
                    clientData.setClientState(data.getString("State"));
                    clientData.setClientCountry(data.getString("Country"));
                    clientData.setProjectTitle(data.getString("ProjectTitle"));
                    clientData.setUrl(data.getString("Url"));
                    clientData.setLogo(data.getString("Logo"));
                    clientData.setProjectId(data.getInt("ProjectId"));
                    clientDetails.add(clientData);
               }

               String json = new Gson().toJson(clientDetails);
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
