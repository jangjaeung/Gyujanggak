package com.daol.library.member.store;

import com.daol.library.member.domain.Member;

public interface MemberStore {

	public int insertMember(Member member);

	public Member selectMember(Member memberOne);

	public Member selectId(Member member);

	public Member readMember(String userId);

	public Object idCheck(String userId);

	public int updatePw(Member vo) throws Exception;

	public int checkIdDup(String userId);


}
