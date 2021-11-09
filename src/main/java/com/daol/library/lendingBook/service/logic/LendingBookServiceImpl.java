package com.daol.library.lendingBook.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.store.BookStore;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.lendingBook.store.LendingBookStore;

@Service
public class LendingBookServiceImpl implements LendingBookService {
	@Autowired
	private LendingBookStore store;
	
	@Autowired
	private BookStore bookStore;

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
	public int registerLending(Book book) {
		int result = 0;
		result += store.insertLending(book);
		result += bookStore.updateOne(book);
//		result += bookStore.updateOne(book.getBookNo());
		return result;
	}

	@Override
	public int removeLending(int lendingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyLending(LendingBook lendingBook) {
		// TODO Auto-generated method stub
		return 0;
	}

}
