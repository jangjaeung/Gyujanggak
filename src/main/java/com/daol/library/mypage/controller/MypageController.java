package com.daol.library.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	//마이페이지 메인 화면
	@RequestMapping(value="mypageMain.do", method=RequestMethod.GET)
	public String mypageMainView() {
		return "mypage/mypageMain";
	}
}
