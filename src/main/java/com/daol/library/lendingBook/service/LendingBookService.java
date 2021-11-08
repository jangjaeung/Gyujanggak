package com.daol.library.lendingBook.service;

import java.util.List;

import com.daol.library.lendingBook.domain.LendingBook;

public interface LendingBookService {
	public List<LendingBook> printAll();
	public LendingBook printOne(int lendingNo);
	public int registerLending(LendingBook lendingBook);
	public int removeLending(int lendingNo);
	public int modifyLending(LendingBook lendingBook);
}
