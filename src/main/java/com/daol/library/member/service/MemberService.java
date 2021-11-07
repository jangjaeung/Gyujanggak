package com.daol.library.member.service;

import javax.servlet.http.HttpServletResponse;

import com.daol.library.member.domain.Member;

public interface MemberService {

	public int registerMember(Member member);

	public Member loginMember(Member memberOne);

	public Member printOne(Member member);

	//이메일발송
	public void sendEmail(Member vo, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, Member vo) throws Exception;

	public int checkIdDup(String userId);

}
