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
import javax.servlet.http.HttpSession;

@WebServlet(name = "FetchTaskDetails", urlPatterns = {"/FetchTaskDetails"})
public class FetchTaskDetails extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          PrintWriter out = response.getWriter();
          HttpSession session = request.getSession();
          String userId = (String) session.getAttribute("userId");
          try {
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PMS", "root", "");
               PreparedStatement stmt = con.prepareStatement("SELECT Task.Id, Task.Task, Task.Status, Projects.ProjectTitle, Developers.DeveloperName FROM Task INNER JOIN Projects ON Projects.Id = Task.ProjectId INNER JOIN Developers ON Developers.Id = Task.DeveloperId WHERE Developers.Id = ? AND Task.Status != 'Complete' ORDER BY Task.Id DESC");
               stmt.setString(1, userId);
               ResultSet data = stmt.executeQuery();

               List<TaskGS> taskDetails = new ArrayList<>();
               while (data.next()) {
                    TaskGS taskData = new TaskGS();
                    taskData.setId(data.getInt("Id"));
                    taskData.setTask(data.getString("Task"));
                    taskData.setStatus(data.getString("Status"));
                    taskData.setProjectName(data.getString("ProjectTitle"));
                    taskData.setDeveloperName(data.getString("DeveloperName"));
                    taskDetails.add(taskData);
               }

               String json = new Gson().toJson(taskDetails);
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
