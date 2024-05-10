package com.example.tp7_jdbc.service;

import com.example.tp7_jdbc.service.model.Article;

import java.util.List;

public interface Iservice {
    Boolean checkAccount(String username,String password);
    List<Article> getAllArticle();

}
