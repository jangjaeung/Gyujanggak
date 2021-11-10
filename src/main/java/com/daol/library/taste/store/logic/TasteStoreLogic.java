package com.daol.library.taste.store.logic;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;
import com.daol.library.taste.store.TasteStore;

public class TasteStoreLogic implements TasteStore{

	@Override
	public int insertTatseSurvey(TasteSurvey survey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTaste(Taste taste) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Book> selectBooksByTaste(Taste taste) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBooksByMajor(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

}
