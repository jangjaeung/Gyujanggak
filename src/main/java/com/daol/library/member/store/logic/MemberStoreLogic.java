package com.daol.library.member.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.member.domain.Member;
import com.daol.library.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		int result = sqlSession.insert("membermapper.insertMember",member);
		return result;
	}

	@Override
	public Member selectMember(Member memberOne) {
		Member mOne = sqlSession.selectOne("membermapper.selectLoginMember", memberOne);
		return mOne;
	}
}
