package com.daol.library.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService service;
	
//	간략 검색
//	@RequestMapping(value="/search.do", method=RequestMethod.GET)
	@GetMapping("/search.do")
	public String searchView() {
		return "book/bookSearchSimple";
	}
//	@RequestMapping(value="/searchSimple.do", method=RequestMethod.GET)
	@GetMapping("/searchSimple.do")
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
	
//	상세 검색
	@GetMapping("/sDetail.do")
	public String sDetail() {
		return "book/bookSearchDetail";
	}
	@GetMapping("/searchDetail.do")
	public String detailSearchList(@ModelAttribute Search search, Model model) {
		List<Book> bList = service.printSearchDetail(search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			return "book/bookSearchDetail";
		} else {
			return "book/bookSearchDetail";
		}
	}
	
//	도서 상세 조회
	@GetMapping("/bookDetail.do")
	public ModelAndView bookDetail(ModelAndView mv, @RequestParam("bookNo") int bookNo) {
		Book book = service.printOne(bookNo);
		if(book != null) {
			mv.addObject("book", book);
			mv.setViewName("book/bookDetail");
		} else {
			mv.addObject("msg", "상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
