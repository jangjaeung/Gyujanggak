package com.daol.library.reservationBook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;

@Controller
public class ReservationBookController {
	@Autowired
	private ReservationBookService service;
	
//	도서 예약
	@ResponseBody
	@GetMapping("/reservationBook.do")
	public void reservationBook(HttpServletResponse response, @ModelAttribute ReservationBook rsvBook, @RequestParam("bookNo") int bookNo) throws IOException {
		List<ReservationBook> rList = service.printAddCheck(rsvBook);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(rList.isEmpty()) {
			service.registerRsv(rsvBook);
			out.println("<script>alert('도서 예약 완료'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('이미 예약된 도서입니다.'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		}
	}
	
//	도서 예약 조회
	@GetMapping("/bookingList.do")
	public String bookingList(@ModelAttribute ReservationBook rsvBook, Model model) {
		List<ReservationBook> rList = service.printAllRsvBook(rsvBook.getUserId());
		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			return "mypage/bookingList";
		} else {
			return "mypage/bookingList";
		}
	}
	
//	도서 예약 삭제
	@ResponseBody
	@GetMapping("/deleteReservation.do")
	public void deleteRsv(HttpServletResponse response, @ModelAttribute ReservationBook rsvBook) throws IOException {
		int result = service.removeRsv(rsvBook);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('도서 예약 취소 완료'); location.href='/bookingList.do?userId=" + rsvBook.getUserId() +"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('도서 예약 취소 실패'); location.href='/bookingList.do?userId="+ rsvBook.getUserId() +"';</script>");
			out.flush();
		}
	}
	
}
