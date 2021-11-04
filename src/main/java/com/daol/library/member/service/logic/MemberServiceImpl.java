package com.daol.library.member.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.member.domain.Member;
import com.daol.library.member.service.MemberService;
import com.daol.library.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberStore store;

	@Override
	public int registerMember(Member member) {
		int result = store.insertMember(member);
		return result;
	}

	@Override
	public Member loginMember(Member memberOne) {
		Member mOne = store.selectMember(memberOne);
		return mOne;
	}

}
