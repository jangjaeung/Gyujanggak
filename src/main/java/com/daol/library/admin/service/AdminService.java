package com.daol.library.admin.service;

import java.util.List;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.book.domain.Book;


	
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;

public interface AdminService {
	public int getListCount();

	public List<Book> printAll(PageInfo pi);

	//관리자페이지 유저타입 끌어오기
	public Member memberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> printAllQna(PageInfo pi);
	public int getQnaListCount();
	//관리자게시판 문의검색
	public List<Qna> printSearchAll(Search search,PageInfo pi);
	//검색페이징용
	public int getSearchQnaListCount(Search search);
	//qna상세
	public Qna printOneQna(int qnaNo);
	//답변등록
	public int modifyAnswer(Qna qna);
}
