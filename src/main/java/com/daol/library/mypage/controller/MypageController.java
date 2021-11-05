package com.daol.library.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	//마이페이지 회원정보 조회 화면
	@RequestMapping(value="mypageInfo.do", method=RequestMethod.GET)
	public String mypageInfoView() {
		return "mypage/mypageInfo";
	}
	
	//마이페이지 정보 수정 화면
	@RequestMapping(value="modifyInfoView.do", method=RequestMethod.GET)
	public String modifyInfoView() {
		return "mypage/modifyInfo";
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
}
