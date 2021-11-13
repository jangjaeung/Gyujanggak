package com.daol.library;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BookService book;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<Keyword> kList = book.printPopKeyword();
		List<Book> bList = book.printNewBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList",bList);
			model.addAttribute("kList",kList);
			return "home";
		}else {
			model.addAttribute("msg","실패실패실패");
			return "common/errorPage";
		}
	}
}
