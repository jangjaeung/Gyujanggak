package com.daol.library.mypage.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daol.library.member.domain.Member;
import com.daol.library.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	//마이페이지 회원정보 조회 화면
	@RequestMapping(value="mypageInfo.do", method=RequestMethod.GET)
	public String mypageInfoView(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//택배 주소 추가하기!!!!
		try {
			Member memberOne = service.printOneInfo(member);
			session.setAttribute("loginUser", memberOne);
			return "mypage/mypageInfo";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","회원 정보 조회 실패!");
			return "common/errorPage";
		}
		
	}
	
	//마이페이지 정보 수정 화면
	@RequestMapping(value="modifyInfoView.do", method=RequestMethod.GET)
	public String modifyInfoView(@ModelAttribute Member member,HttpServletRequest request) {
		return "mypage/modifyInfo";
	}
	
	
	//회원 정보 수정
	@RequestMapping(value="modifyInfo.do", method=RequestMethod.POST)
	public String modifyInfo(@ModelAttribute Member member, @RequestParam("enrollDate2") String enrollDate2, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		member.setEnrollDate(Date.valueOf(enrollDate2));
		try {
			int result = service.modifyMember(member);
			if(result>0) {
				session.setAttribute("loginUser", member);
				return "mypage/mypageInfo";
			}else {
				model.addAttribute("msg", "회원 정보 수정 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	
	
	//마이페이지 회원탈퇴 화면
	@RequestMapping(value="leaveAccount.do", method=RequestMethod.GET)
	public String leaveAccountView() {
		return "mypage/leaveAccount";
	}
	
	//대출현황
	@RequestMapping(value="lendingStatus.do", method=RequestMethod.GET)
	public String lendingStatus() {
		return "mypage/lendingStatus";
	}
	
	//예약현황 조회
	@RequestMapping(value="bookingList.do", method=RequestMethod.GET)
	public String bookingList() {
		return "mypage/bookingList";
	}
	
	//희망도서 내역
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public String wishList() {
		return "mypage/wishList";
	}
	
	//관심 도서 내역
	@RequestMapping(value="likeList.do", method=RequestMethod.GET)
	public String likeList() {
		return "mypage/likeList";
	}
	
	//취향분석설문 화면
	@RequestMapping(value="tasteSurvey.do", method=RequestMethod.GET)
	public String tasteSurveyView() {
		return "mypage/tasteSurvey";
	}
	
	//열람실 이용내역
	@RequestMapping(value="readingroomHistory.do", method=RequestMethod.GET)
	public String readingroomHistory() {
		return "mypage/readingroomHistory";
	}
	
	//스터디룸 이용내역
	@RequestMapping(value="studyroomHistory.do", method=RequestMethod.GET)
	public String studyroomHistory() {
		return "mypage/studyroomHistory";
	}
	
}

