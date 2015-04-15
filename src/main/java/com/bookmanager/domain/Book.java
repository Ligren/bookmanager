package com.bookmanager.domain;

import javax.persistence.*;

@Entity
@Table(name = "books")

public class Book {

    @Id
    @Column(name  = "id")
    @GeneratedValue
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "genre")
    private String genre;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}