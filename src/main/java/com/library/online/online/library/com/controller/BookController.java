package com.library.online.online.library.com.controller;

import com.library.online.online.library.com.entity.Book;
import com.library.online.online.library.com.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @RequestMapping("/books")
    public Iterable<Book> getBooks() {
        return bookRepository.findAll();
    }
}
