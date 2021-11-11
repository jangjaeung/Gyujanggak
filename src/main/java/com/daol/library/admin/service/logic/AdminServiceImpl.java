package com.daol.library.admin.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.service.AdminService;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.PageInfo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminStore store;
	
	//유저타입 끌어오기용
	@Override
	public Member memberCk(String login) {
		return store.selectMemberCk(login);
	}
	
	//관리자-문의리스트 끌어오기
	@Override
	public List<Qna> printAllQna(PageInfo pi) {
		return store.selectAllQna(pi);
	}

	@Override
	public int getListCount() {
		return store.selectListCount();
	}
}
