package com.bookmanager.repository;

import com.bookmanager.domain.Book;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public class BookRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public void addBook(Book book) {
        System.out.println("------мы репозиторие в методе add book");
        this.sessionFactory.getCurrentSession().save(book);
    }

    public List<Book> listAll(){
        System.out.println("------мы репозиторие в методе list All");
        return this.sessionFactory.getCurrentSession().createQuery("from Book").list();
    }

    public void removeBook(Integer id) {
        Book contact = (Book) this.sessionFactory.getCurrentSession().load(
                Book.class, id);
        if (null != contact) {
            this.sessionFactory.getCurrentSession().delete(contact);
        }
    }
}
