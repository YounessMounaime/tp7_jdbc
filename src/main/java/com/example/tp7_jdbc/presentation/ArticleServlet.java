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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres de la requête pour créer un nouvel article
        String description = request.getParameter("description");
        double quantite = Double.parseDouble(request.getParameter("quantite"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Créer un nouvel objet Article avec les paramètres
        Article newArticle = new Article(description, quantite, price);

        // Ajouter l'article à la base de données
        service.addArticle(newArticle);

        // Rediriger vers la page d'accueil après l'ajout
        response.sendRedirect(request.getContextPath() + "/articles.do");

    }
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            long articleId = Long.parseLong(request.getParameter("id"));
            service.deleteArticle(articleId);
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }


}
