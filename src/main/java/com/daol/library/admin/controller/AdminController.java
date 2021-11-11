package com.daol.library.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.admin.common.Pagination;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.service.AdminService;
import com.daol.library.book.domain.Book;

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
}
