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
}
