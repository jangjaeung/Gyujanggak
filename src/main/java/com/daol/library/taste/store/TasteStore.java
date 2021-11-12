package com.daol.library.taste.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;

public interface TasteStore {
	//설문
	public int insertTatseSurvey(TasteSurvey survey);
	//취향 리스트 1,2,3
	public int insertTaste(Taste taste);
	//취향별 도서 추천, 도서에 등록된 취향 조건으로 리스트 출력 
	public List<Book> selectBooksByTaste(Taste taste);
	//전공별 도서 추천, 멤버에 등록된 전공으로 책 추천
	public List<Book> selectBooksByMajor(Member member);
}