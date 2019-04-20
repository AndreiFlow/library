package com.library.online.online.library.com.converters;

import com.library.online.online.library.com.dto.BookDTO;
import com.library.online.online.library.com.entity.Author;
import com.library.online.online.library.com.entity.Book;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

public class BookConverter {

    public static BookDTO convert(Book book) {
        BookDTO bookDTO = new BookDTO();
        bookDTO.setId(book.getId());
        bookDTO.setName(book.getName());
        bookDTO.setAuthor(getAuthorsName(book));
        bookDTO.setLanguage(book.getLanguages().toString());
        bookDTO.setDescription(book.getDescription());
        bookDTO.setPublisher(book.getPublisher());
        bookDTO.setPublicationDate(1900 + book.getPublicationDate().getYear() + "");
        bookDTO.setBase64image(createImageUrl(book));

        return bookDTO;
    }

    private static String getAuthorsName(Book book) {
        final List<Author> authors = book.getAuthors();
        String result = "";
        final Iterator<Author> iterator = authors.iterator();
        final Author author = iterator.next();
        result += author.getFirstName() + " " + author.getLastName();
        while (iterator.hasNext()) {
            Author nextAuthor = iterator.next();
            result += ", " + nextAuthor.getFirstName() + " " + nextAuthor.getLastName();
        }
        return result;
    }

    private static String createImageUrl(Book book) {

        final File file = new File("src/main/resources" + book.getImagePath());
        return encodeFileToBase64Binary(file);
    }

    private static String encodeFileToBase64Binary(File file) {
        String encodedfile = null;
        try {
            FileInputStream fileInputStreamReader = new FileInputStream(file);
            byte[] bytes = new byte[(int) file.length()];
            fileInputStreamReader.read(bytes);
            encodedfile = Base64.getEncoder().encodeToString(bytes);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return encodedfile;
    }
}
