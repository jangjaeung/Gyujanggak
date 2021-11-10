package com.daol.library.lendingBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daol.library.book.domain.Book;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.member.service.MemberService;

@Controller
public class LendingBookController {
	@Autowired
	private LendingBookService service;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberService;
	
//	도서 대출
	@PostMapping("/lendingBook.do")
	public void lendingBook(HttpServletResponse response, Model model, @RequestParam("bookNo") int bookNo, @RequestParam("userId") String userId, @RequestParam("bookReceive") String bookReceive) throws IOException {
		Book book = bookService.printOne(bookNo);
		LendingBook lendBook = new LendingBook();
//		int bookNo = Integer.parseInt(request.getParameter(book.getBookNo()));
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		lendBook.setBookNo(bookNo);
		lendBook.setReceive(bookReceive);
		lendBook.setUserId(userId);
		if(bookReceive.equals("visit")) {
			int result = 0;
			result += service.registerLending(lendBook);
			result += bookService.modifyLendingBook(bookNo);
			result += memberService.modifyOne(userId);
//			model.addAttribute("bookNo", bookNo);
//			model.addAttribute("userId", userId);
//			model.addAttribute("bookReceive", bookReceive);
			if(result >= 3) {
				out.println("<script>alert('대출 신청 완료'); location.href='/bookDetail.do?bookNo="+lendBook.getBookNo()+"';</script>");
//				return "redirect:/bookDetail.do?bookNo="+lendBook.getBookNo();
				out.flush();
			} else {
				out.println("<script>alert('대출 신청 실패'); location.href='/bookDetail.do?bookNo="+lendBook.getBookNo()+"';</script>");
				out.flush();
//				return "common/errorPage";
			}
	    }
		
	}
	
}
