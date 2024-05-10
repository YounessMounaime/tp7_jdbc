package com.example.tp7_jdbc.presentation;


import com.example.tp7_jdbc.service.Iservice;
import com.example.tp7_jdbc.service.ServiceImpl;
import com.example.tp7_jdbc.service.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/articles.do")
public class ArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServiceImpl service = new ServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Article> articles = service.getAllArticle();
        request.setAttribute("articles", articles);
        request.getRequestDispatcher("/view/welcome.jsp").forward(request, response);
    }

}
