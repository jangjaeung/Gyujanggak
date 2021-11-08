package com.daol.library.lendingBook.store;

import java.util.List;

import com.daol.library.lendingBook.domain.LendingBook;

public interface LendingBookStore {
	public List<LendingBook> selectAll();
	public LendingBook selectOne(int lendingNo);
	public int insertLending(LendingBook lendingBook);
	public int deleteLending(int lendingNo);
	public int updateLending(LendingBook lendingBook);
}
