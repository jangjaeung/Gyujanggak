package com.daol.library;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BookService book;
	@Autowired
	private LendingBookService lend;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<Book> bList = book.printNewBook();
		List<Book> pList = book.printBestBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList",bList);
			model.addAttribute("pList",pList);
			return "home";
		}else {
			model.addAttribute("msg","실패실패실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="popKeyword.do", method=RequestMethod.GET)
	public void popKeyword(HttpServletResponse response) throws JsonIOException, IOException {
		List<Keyword> kList = book.printPopKeyword();
		Gson gson = new Gson();
		gson.toJson(kList,response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping(value="manyBook.do", method=RequestMethod.GET)
	public void manyBookPeople(HttpServletResponse response) throws JsonIOException, IOException{
		List<LendingBook> lList = lend.printManyPeople();
		Gson gson = new Gson();
		gson.toJson(lList,response.getWriter());
	}
}
