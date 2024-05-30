package com.example.tp7_jdbc.dao;

import com.example.tp7_jdbc.service.model.User;

import java.util.List;


public interface IDao {
    User findById(Long id);
    void delete(Long id);
    List<User> findAllUsers();
    User getUserByUsername(String username);
    void save(User user);
    void deleteAll();
    // Nouvelle méthode pour la modification
    void updatePassword(Long id, String newPassword);

}