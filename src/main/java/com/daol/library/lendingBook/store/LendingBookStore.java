package com.daol.library.lendingBook.store;

import java.util.HashMap;
import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.lendingBook.domain.LendingBook;

public interface LendingBookStore {
	public List<LendingBook> selectAll();
	public LendingBook selectOne(int lendingNo);
	public int insertLending(LendingBook lendingBook);
	public int deleteLending(HashMap<String, String> deleteLending);
	public int updateLending(LendingBook lendingBook);
}
