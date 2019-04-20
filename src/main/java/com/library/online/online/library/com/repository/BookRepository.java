package com.library.online.online.library.com.repository;

import com.library.online.online.library.com.entity.Book;
import org.springframework.data.repository.CrudRepository;

public interface BookRepository extends CrudRepository<Book, Long> {

}
