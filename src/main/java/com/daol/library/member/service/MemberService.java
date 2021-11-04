package com.daol.library.member.service;

import com.daol.library.member.domain.Member;

public interface MemberService {

	public int registerMember(Member member);

	public Member loginMember(Member memberOne);

}
