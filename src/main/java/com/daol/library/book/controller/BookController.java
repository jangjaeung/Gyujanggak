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
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;

@Controller
public class BookController {
	@Autowired
	private BookService service;
	
	@Autowired
	private LendingBookService LendingBookService;
	
//	간략 검색
	@GetMapping("/search.do")
	public String searchView() {
		return "book/bookSearchSimple";
	}
	@GetMapping("/searchSimple.do")
	public String simpleSearchList(@ModelAttribute Search search, Model model) {
		List<Book> bList = service.printSearchSimple(search);
		regiKeyword(search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			return "book/bookSearchSimple";
		} else {
			return "book/bookSearchSimple";
		}
	}
	
	//검색어 저장
	public void regiKeyword(Search search) {
		service.regiKeyword(search);
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
	
//	주제별 검색
	@GetMapping("/sSub.do")
	public String sSub() {
		return "book/bookSearchSubject";
	}
	@GetMapping("/searchSubject.do")
	public String subjectSearchList(@ModelAttribute Search search, Model model) {
		List<Book> bList = service.printSearchSub(search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			return "book/bookSearchSubject";
		} else {
			return"book/bookSearchSubject";
		}
	}
	
//	신착 자료 조회
	@GetMapping("/searchNew.do")
	public String searchNewList(Model model) {
		List<Book> bList = service.printNewBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			return "book/bookSearchNew";
		} else {
			return"book/bookSearchNew";
		}
	}
	
//	대출 베스트 조회
	@GetMapping("/bestBook.do")
	public String bestBookList(Model model) {
		List<Book> bList = service.printBestBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			return "book/bookPopular";
		} else {
			return"book/bookPopular";
		}
	}
	
//	도서 상세 조회
	@GetMapping("/bookDetail.do")
	public ModelAndView bookDetail(ModelAndView mv, @RequestParam("bookNo") int bookNo) {
		Book book = service.printOne(bookNo);
		LendingBook lendingBook = LendingBookService.printOneForDetail(bookNo);
		if(book != null) {
			mv.addObject("book", book);
			mv.addObject("lendingBook", lendingBook);
			mv.setViewName("book/bookDetail");
		} else {
			mv.addObject("msg", "상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//	도서 대출 페이지 이동
	@GetMapping("/lendingBookView.do")
	public ModelAndView lendingBookView(ModelAndView mv, @RequestParam("bookNo") int bookNo) {
		Book book = service.printOne(bookNo);
		if(book != null) {
			mv.addObject("book", book);
			mv.setViewName("lendingBook/lendingBookView");
		} else {
			mv.addObject("msg", "대출 신청 실패");
			mv.setViewName("book/bookDetail");
		}
		return mv;
	}
	
}
