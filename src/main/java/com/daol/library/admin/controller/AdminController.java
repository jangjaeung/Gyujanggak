package com.daol.library.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.admin.service.AdminService;
import com.daol.library.common.Pagination;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.PageInfo;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	
	
	//관리자페이지 문의관리 이동
	@RequestMapping(value="adQnaList.do",method=RequestMethod.GET)
	public ModelAndView qnaListView(ModelAndView mv,@RequestParam(value="page",required=false)Integer page,HttpSession session) {
		String login = (String)session.getAttribute("userId");
		Member member = service.memberCk(login);
		if(member != null) {
			String userType = member.getUserType();
			mv.addObject("userType",userType);
		}
		int currentPage = (page!=null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Qna> qList = service.printAllQna(pi);
		if(!qList.isEmpty()) {
			mv.addObject("qList",qList);
			mv.addObject("pi",pi);
		}
		mv.setViewName("admin/qnaListView");
		return mv;
	}
}
