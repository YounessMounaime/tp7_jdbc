package com.example.tp7_jdbc.service;


import com.example.tp7_jdbc.dao.DaoImplJPA;
import com.example.tp7_jdbc.dao.IDao;
import com.example.tp7_jdbc.dao.article.ArticleDaoImplJPA;
import com.example.tp7_jdbc.dao.article.IArticleDao;
import com.example.tp7_jdbc.service.model.Article;
import com.example.tp7_jdbc.service.model.User;

import java.util.List;

public class ServiceImpl implements Iservice {
    private IDao dao = new DaoImplJPA();
    private IArticleDao daoArticle = new ArticleDaoImplJPA();
    @Override
    public Boolean checkAccount(String username, String password) {
        User u = dao.getUserByUsername(username);
        if (u == null)
            return false;
        return (password.equals(u.getPassword()));
    }
    @Override
    public List<Article> getAllArticle() {
        return daoArticle.findAll();
    }
}