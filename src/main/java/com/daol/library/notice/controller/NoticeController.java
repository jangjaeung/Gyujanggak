package com.daol.library.notice.controller;

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

import com.daol.library.notice.common.Pagination;
import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;
import com.daol.library.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
	public ModelAndView boardListView(
			ModelAndView mv
			, @RequestParam(value="page", required=false)Integer page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Notice> bList = service.printAll(pi);
		if(!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi",pi);
			mv.addObject("userId", userId);
			mv.setViewName("notice/noticeList");
//			return "board/boardListView";
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//			return "common/errorPage";
		}
		return mv;
	}
	
	@RequestMapping(value = "noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite(@ModelAttribute Notice notice, HttpServletRequest request,
			Model model) {
			
			int result = service.registerNotice(notice);
			if(result > 0) {
				return "redirect:noticeList.do";
			}else {
				model.addAttribute("msg", "공지사항 등록 실패");
				return "common/errorPage";
			}
	}
	
	@RequestMapping(value="writeView.do", method=RequestMethod.GET)
  	public String writeView() {
	  return "notice/noticeWrite"; 
  	}
}
