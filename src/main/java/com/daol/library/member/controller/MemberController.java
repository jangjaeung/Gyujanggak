package com.daol.library.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.daol.library.member.domain.Member;
import com.daol.library.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	 @RequestMapping(value="loginView.do", method=RequestMethod.GET)
	  	public String loginView() {
		  return "member/login"; 
	  	}
	 
	 @RequestMapping(value="enrollView.do", method=RequestMethod.GET)
	 	public String enrollView() {
		 return "member/memberjoin";
	 }
	 
	 @RequestMapping(value="studentView.do", method=RequestMethod.GET)
	 	public String studentView() {
		 return "member/studentjoin";
	 }
	 
	 @RequestMapping(value="enrollType.do", method=RequestMethod.GET)
	 	public String enrollType() {
		 return "member/enrolltype";
	 }
	 
	 @RequestMapping(value="memberView.do", method=RequestMethod.GET)
	 	public String memberView() {
		 return "member/memberjoin";
	 }
	 
	 @RequestMapping(value="searchView.do", method=RequestMethod.GET)
	 	public String searchView() {
		 return "member/searchType";
	 }
	 
	 @RequestMapping(value="idView.do", method=RequestMethod.GET)
	 	public String idView() {
		 return "member/idSearch";
	 }
	 
	 @RequestMapping(value="pwdView.do", method=RequestMethod.GET)
	 	public String pwdView() {
		 return "member/pwdSearch";
	 }
	 
	 @RequestMapping(value="idSearch.do", method=RequestMethod.POST)
	 	public String IdSearch(@ModelAttribute Member member, Model model) {
		 Member mOne = service.printOne(member);
		 if(mOne != null) {
			 model.addAttribute("mOne", mOne);
				return "member/idCheck";
			} else {
				model.addAttribute("msg", "공지사항 상세조회 실패");
				return "common/errorPage";
			}
	 }
	 
	 @RequestMapping(value="enroll.do", method=RequestMethod.POST)
	 	public String Memberregister(@ModelAttribute Member member, @RequestParam(value="uploadFile", required=false)MultipartFile uploadFile,Model model, HttpServletRequest request) {
		// value값은 jsp의 input태그의 name값이고
			// required=false는 파일이 필수가 아님을 알려주는 것이고,
			// MultipartFile은 MultipartResolver 객체를 빈으로 등록해서 사용한다는 것이다.
			if (!uploadFile.getOriginalFilename().equals("")) {
				// uploadFile이 비어있지 않으면
				String filePath = saveFile(uploadFile, request);
				if (filePath != null) {
					member.setProfilePic(uploadFile.getOriginalFilename());
				}
			}
			int result = service.registerMember(member);
			if (result > 0) {
				return "redirect:loginView.do";
			} else {
				model.addAttribute("msg", "공지사항 등록 실패");
				return "common/errorPage";
			}
	 }
	 

		// 파일을 저장하는 메서드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일저장경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 저장폴더 선택
			String savePath = root + "\\muploadFiles";
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
		
		@RequestMapping(value="login.do", method=RequestMethod.POST)
		public String memberLogin(HttpServletRequest request) {
			String memberId = request.getParameter("user-id");
			String memberPwd = request.getParameter("user-pwd");
			// 이제 비지니스 로직(백단)이 실행된다.!!
			Member memberOne = new Member();
			memberOne.setUserId(memberId);
			memberOne.setUserPwd(memberPwd);
			try {
				Member loginUser = service.loginMember(memberOne);
				if(loginUser != null) {
					HttpSession session = request.getSession();
					session.setAttribute("userId", loginUser.getUserId());
				}
				return "redirect:home.do";
			}catch(Exception e) {
				request.setAttribute("msg", e.toString());
				return "common/errorPage";
			}
		}
		
		@RequestMapping(value="logout.do", method=RequestMethod.GET)
		public String memberLogout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			if(session != null) {
				session.invalidate();
				return"redirect:home.do";
			}else {
				request.setAttribute("msg", "로그아웃 실패!");
				return"common/errorPage";
			}
		}
		
		@RequestMapping(value = "findPw.do", method = {RequestMethod.GET, RequestMethod.POST})
		public void findPwPOST(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
			service.findPw(response, member);
			
	
		}
		@ResponseBody
	  	@RequestMapping(value="checkDupId.do", method=RequestMethod.GET)
	  	public String idDuplicateCheck(@RequestParam("userId") String userId) {
	  		int result = service.checkIdDup(userId);
	  		return String.valueOf(result); 
	  	}
		
		
		
}
