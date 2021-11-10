package com.daol.library.lendingBook.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.store.BookStore;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.lendingBook.store.LendingBookStore;
import com.daol.library.member.store.MemberStore;

@Service
public class LendingBookServiceImpl implements LendingBookService {
	@Autowired
	private LendingBookStore store;
	
	@Autowired
	private BookStore bookStore;
	
	@Autowired
	private MemberStore memberStore;

	@Override
	public List<LendingBook> printAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LendingBook printOne(int lendingNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerLending(LendingBook lendingBook) {
		int result = 0;
		result += store.insertLending(lendingBook);
		result += bookStore.updateLendingBook(lendingBook.getBookNo());
		result += memberStore.updateOne(lendingBook.getUserId());
		return result;
	}

	@Override
	public int removeLending(HashMap<String, String> deleteBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyLending(LendingBook lendingBook) {
		// TODO Auto-generated method stub
		return 0;
	}

}
