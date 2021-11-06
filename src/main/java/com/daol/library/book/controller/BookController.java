package com.daol.library.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService service;
	
//	간략검색
	@RequestMapping(value="/search.do", method=RequestMethod.GET)
	public String searchView() {
		return "book/bookSearchSimple";
	}
	@RequestMapping(value="/searchSimple.do", method=RequestMethod.GET)
	public String simpleSearchList(@ModelAttribute Search search, Model model) {
		List<Book> bList = service.printSearchSimple(search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			return "book/bookSearchSimple";
		} else {
//			model.addAttribute("msg", "검색 실패");
//			return "common/errorPage";
			return "book/bookSearchSimple";
		}
	}
	
}
