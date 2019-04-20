package com.library.online.online.library.com.converter;

import com.library.online.online.library.com.dto.BookDTO;
import com.library.online.online.library.com.entity.Author;
import com.library.online.online.library.com.entity.Book;
import com.library.online.online.library.com.entity.Language;

public class BookConverter {

    public static BookDTO convert(Book book){
        BookDTO dto = new BookDTO();

        dto.setId(book.getId());
        dto.setName(book.getName());
        dto.setDescription(book.getDescription());
        dto.setPublisher(book.getPublisher());
        dto.setLanguages(getLanguages(book));
        dto.setAuthors(getAuthors(book));
        dto.setPublicationDate(book.getPublicationDate().getYear() + "");

        return dto;
    }

    private static String getAuthors(Book book) {
        String authprs = "";
        for (Author author : book.getAuthors()) {
            authprs += author.getFirstName() + " " + author.getLastName() + ";";
        }
        return authprs;
    }

    private static String getLanguages(Book book) {
        String languages = "";
        for (Language language : book.getLanguages()) {
            languages += language.getName() + " ";
        }
        return languages;
    }

}
