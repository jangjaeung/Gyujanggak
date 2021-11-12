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
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;
import com.daol.library.post.service.PostService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Autowired
	private PostService pService;
	
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
	
	//신고관리 리스트
	@RequestMapping(value="reportView.do",method=RequestMethod.GET)
	public ModelAndView reportView(ModelAndView mv,HttpSession session,@RequestParam(value="page",required=false)Integer page) {
		String login = (String)session.getAttribute("userId");
		Member member = service.memberCk(login);
		if(member != null) {
			String userType = member.getUserType();
			mv.addObject("userType",userType);
		}
		int currentPage = (page!=null) ? page : 1;
		int totalCount = service.getPostReportCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Post> rpList = service.printAllReportPost(pi);
		mv.addObject("rpList",rpList);
		mv.addObject("pi",pi);
		int reCurrentPage = (page!=null) ? page : 1;
		int reTotalCount = service.getReplyReportCount();
		PageInfo rpi = Pagination.getPageInfo(reCurrentPage, reTotalCount);
		List<Reply> rrList = service.printAllReportReply(rpi);
		mv.addObject("rrList",rrList);
		mv.addObject("rpi",rpi);
		mv.setViewName("admin/reportView");
		return mv;
	}
	//신고 게시글 삭제
	@RequestMapping(value="delPost.do",method=RequestMethod.GET)
	public String removePost(@RequestParam("postNo") int postNo) {
		int result = pService.removePost(postNo);
		if(result > 0) {
			return "redirect:reportView.do";
		}else {
			return "common/errorPage";
		}
	}
	//신고 댓글 삭제
	@RequestMapping(value="delReply.do",method=RequestMethod.GET)
	public String deleteReply(@ModelAttribute Reply reply) {
		int result = pService.removeReply(reply);
		if(result>0) {
			return "redirect:reportView.do";
		}else {
			return "common/errorPage";
		}
	}
}
