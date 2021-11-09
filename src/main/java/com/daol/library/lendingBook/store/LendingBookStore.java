package com.daol.library.lendingBook.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.lendingBook.domain.LendingBook;

public interface LendingBookStore {
	public List<LendingBook> selectAll();
	public LendingBook selectOne(int lendingNo);
	public int insertLending(Book book);
	public int deleteLending(int lendingNo);
	public int updateLending(LendingBook lendingBook);
}
