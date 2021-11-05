package com.daol.library.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.post.common.Pagination;
import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.service.PostService;

@Controller
public class PostController {
	
	@Autowired
	private PostService service;
	
	@RequestMapping(value="postList.do",method=RequestMethod.GET)
	public ModelAndView postListView(ModelAndView mv, @RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page!=null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Post> pList = service.printAll(pi);//댓글수 불러오는 쿼리문 작성
		
		if(!pList.isEmpty()) {
			mv.addObject("pList",pList);
			mv.addObject("pi",pi);
			mv.setViewName("postView/postList");
		}else {
			mv.addObject("msg","게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
