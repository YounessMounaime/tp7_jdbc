package com.example.tp7_jdbc.service.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.Builder;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Article {
    @Id
    @GeneratedValue
    private Long id;
    private String description;
    private Double quantite;
    private Double price;

    public Article( String description, double quantite, double price) {

        this.description = description;
        this.quantite = quantite;
        this.price = price;
    }
}
