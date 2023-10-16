package com.backendServletFiles;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StoreDeveloper", urlPatterns = {"/StoreDeveloper"})
public class StoreDeveloper extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          String userId = request.getParameter("userId");
          String userName = request.getParameter("userName");
          HttpSession session = request.getSession();
          session.setAttribute("userId", userId);
          session.setAttribute("userName", userName);
          RequestDispatcher redirect = request.getRequestDispatcher("pages/password.jsp");
          redirect.forward(request, response);
     }

}
