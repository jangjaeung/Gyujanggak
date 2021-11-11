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
	
	public List<Book> printSearchAll(Search search);

	//관리자페이지 유저타입 끌어오기
	public Member memberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> printAllQna(PageInfo pi);
	public int getQnaListCount();

	public int enrollBook(Book book);

	public int bookDelete(int[] nums);
}
