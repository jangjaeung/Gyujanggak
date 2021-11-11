package com.daol.library.admin.service;

import java.util.List;

import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.PageInfo;

public interface AdminService {
	
	//관리자페이지 유저타입 끌어오기
	public Member memberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> printAllQna(PageInfo pi);
	public int getListCount();
}
