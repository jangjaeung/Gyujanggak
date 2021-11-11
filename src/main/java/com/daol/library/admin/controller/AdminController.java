package com.daol.library.admin.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.admin.common.Pagination;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.service.AdminService;
import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping(value="bookListView.do", method=RequestMethod.GET)
  	public ModelAndView historyView(ModelAndView mv,@ModelAttribute Book book, @RequestParam(value="page", required=false)Integer page, HttpServletRequest request) {
		
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Book> bList = service.printAll(pi);
	
		if(!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi",pi);
			mv.setViewName("adminbook/bookList");
//			return "board/boardListView";
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//			return "common/errorPage";
		}
		return mv;
	}
	
	
	//관리자페이지 문의관리 이동
	@RequestMapping(value="adQnaList.do",method=RequestMethod.GET)
	public ModelAndView qnaListView(ModelAndView mv,@RequestParam(value="page",required=false)Integer page,HttpSession session) {
		String login = (String)session.getAttribute("userId");
		Member member = service.memberCk(login);
		int pn = 1;
		if(member != null) {
			String userType = member.getUserType();
			mv.addObject("userType",userType);
		}
		int currentPage = (page!=null) ? page : 1;
		int totalCount = service.getQnaListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Qna> qList = service.printAllQna(pi);
		if(!qList.isEmpty()) {
			mv.addObject("qList",qList);
			mv.addObject("pi",pi);
			mv.addObject("pn",pn);
		}
		mv.setViewName("admin/qnaListView");
		return mv;
	}
	
	//관리자 문의관리 검색
	@RequestMapping(value="qnaSearch.do",method=RequestMethod.GET)
	public String noticeSearchList(@ModelAttribute Search search,Model model,@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page!=null) ? page : 1;
		int totalCount = service.getSearchQnaListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Qna> qList = service.printSearchAll(search,pi);
		int pn = 0;
		if(!qList.isEmpty()) {
			model.addAttribute("qList",qList);
			model.addAttribute("search",search);
			model.addAttribute("pi",pi);
			model.addAttribute("pn",pn);
			return "admin/qnaListView";
		}else {
			model.addAttribute("qList",qList);
			model.addAttribute("search",search);
			return "admin/qnaListView";
		}
	}
	//문의 상세페이지
	@RequestMapping(value="qnaAnswer.do",method=RequestMethod.GET)
	public ModelAndView qnaAnswer(ModelAndView mv,@RequestParam("qnaNo") int qnaNo) {
		Qna qna = service.printOneQna(qnaNo);
		mv.addObject("qna",qna);
		mv.setViewName("admin/qnaAnswerView");
		return mv;
	}
	
	//답변등록
	@RequestMapping(value="answer.do",method=RequestMethod.POST)
	public String answer(@ModelAttribute Qna qna,HttpSession session) {
		String login = (String)session.getAttribute("userId");
		qna.setReplyUserId(login);
		int result = service.modifyAnswer(qna);
		System.out.println(qna.toString());
		if(result>0) {
			return "redirect:adQnaList.do";
		}else {
			return "common/errorPage";
		}
	}
	
}
