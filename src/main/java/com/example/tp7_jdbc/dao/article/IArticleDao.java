package com.example.tp7_jdbc.dao.article;
import com.example.tp7_jdbc.service.model.*;

import java.util.List;
public interface IArticleDao {
    Article findById(Long id);
    void delete(Long id);
    List<Article> findAll();
    void save(Article article);
    void deleteAll();
}
