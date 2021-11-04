package com.daol.library.member.store;

import com.daol.library.member.domain.Member;

public interface MemberStore {

	public int insertMember(Member member);

	public Member selectMember(Member memberOne);

}
