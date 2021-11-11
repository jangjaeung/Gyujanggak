package com.daol.library.admin.controller;


import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
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
  	public ModelAndView bookListView(ModelAndView mv,@ModelAttribute Book book, @RequestParam(value="page", required=false)Integer page, HttpServletRequest request) {
		
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
	
	@RequestMapping(value="bookSearch.do", method=RequestMethod.GET)
	public String bookSearchList(@ModelAttribute Search search, Model model){
		List<Book> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("bList", searchList);
			model.addAttribute("search", search);
			return "adminbook/bookList";
		}else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "common/errorPage";
		}
	}
	 @RequestMapping(value="bookEnrollView.do", method=RequestMethod.GET)
	  	public String bookEnrollView() {
		  return "adminbook/bookEnroll"; 
	  	}
	 
	 @RequestMapping(value="booksEnroll.do", method=RequestMethod.POST)
	 	public String bookEnroll(@ModelAttribute Book book,@RequestParam(value="bookCoverFile", required=false)MultipartFile bookCover,Model model, HttpServletRequest request ) {
		 
		 if (!bookCover.getOriginalFilename().equals("")) {
				// uploadFile이 비어있지 않으면
				String filePath = saveFile(bookCover, request);
				if (filePath != null) {
					book.setBookCover(bookCover.getOriginalFilename());
				}
			}
		 int result = service.enrollBook(book);
		 if(result > 0) {
			 return "redirect:bookListView.do";
		 }else {
			 model.addAttribute("msg","책 등록 실패");
			 return "common/errorPage";
		 }
		 
		 
	 }
	 public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일저장경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 저장폴더 선택
			String savePath = root + "\\bookcover";
			// 없으면 생성
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdir(); // 폴더 생성
			}
			String filePath = folder + "\\" + file.getOriginalFilename();
			// 파일 저장
			try {
				file.transferTo(new File(filePath)); // 파일 저장
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 파일경로 리턴
			return filePath;
		}
	
	 @RequestMapping(value="bookDelete.do", method=RequestMethod.POST)
	 public String deleteBook(HttpServletRequest request,Model model) {
		 String[] bookNo = request.getParameterValues("valueArrTest");
		 int[]nums = new int[bookNo.length];
		 for(int i =0; i<bookNo.length; i++) {
			 nums[i] = Integer.parseInt(bookNo[i]);
		 }
		 
		 int result = service.bookDelete(nums);
		 if(result > 0) {
			 return "redirect:bookListView.do";
		 }else {
			 model.addAttribute("msg","책 삭제 실패");
			 return "common/errorPage";
		 }
		 
	 }
	 
	 
	 
	 
	 
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
		int totalCount = service.getQnaListCount();
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
