package com.example.tp7_jdbc.presentation;

import com.example.tp7_jdbc.dao.DaoImplJPA;
import com.example.tp7_jdbc.service.ServiceImpl;
import com.example.tp7_jdbc.service.model.Article;
import com.example.tp7_jdbc.service.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/user.do")
public class UserServlet  extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DaoImplJPA service = new DaoImplJPA ();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       List<User> users= service.findAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/view/welcome.jsp").forward(request, response);
    }


}