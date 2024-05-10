package com.example.tp7_jdbc.presentation;

import com.example.tp7_jdbc.service.Iservice;
import com.example.tp7_jdbc.service.ServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login.do")
public class AuthenticationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Iservice service=new ServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        if (!service.checkAccount(username, password)) {
            request.setAttribute("AccountIncorrect", "Login or password incorrect !");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
        else {
            request.getSession().setAttribute("username", username);
            request.getRequestDispatcher("/view/main-template.jsp").forward(request, response);
        }
    }
}