package com.daol.library.lendingBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daol.library.book.domain.Book;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.service.LendingBookService;

@Controller
public class LendingBookController {
	@Autowired
	private LendingBookService service;
	
	@Autowired
	private BookService bookService;
	
//	도서 대출
	@PostMapping("/lendingBook.do")
	public String lendingBook(@RequestParam("bookNo") int bookNo) {
		Book book = bookService.printOne(bookNo);
		int result = service.registerLending(book);
		if(result > 2) {
			return "book/bookDetail";
		} else {
			return "common/errorPage";
		}
	}
	
}
