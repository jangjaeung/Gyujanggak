package com.daol.library.book.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;
import com.daol.library.book.store.BookStore;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookStore store;

	@Override
	public List<Book> printAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book printOne(int bookNo) {
		Book book = store.selectOne(bookNo);
		return book;
	}
	
	@Override
	public List<Book> printSearchSimple(Search search) {
		List<Book> bList = store.selectSearchSimple(search);
		return bList;
	}

	@Override
	public List<Book> printSearchDetail(Search search) {
		List<Book> bList = store.selectSearchDetail(search);
		return bList;
	}

	@Override
	public List<Book> printSearchSub(Search search) {
		List<Book> bList = store.selectSearchSub(search);
		return bList;
	}

	@Override
	public List<Book> printSearchNew() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyLendingBook(int bookNo) throws Exception {
		int result = store.updateLendingBook(bookNo);
		if(result == 0) throw new Exception();
		return result;
	}
	
	//메인페이지 신간도서 출력
	@Override
	public List<Book> printNewBook() {
		List<Book> bList = store.selectNewList();
		return bList;
	}

	@Override
	public List<Book> printBestBook() {
		List<Book> bList = store.selectBestBook();
		return bList;
	}
	
	//인기키워드 적립용
	@Override
	public void regiKeyword(Search search) {
		String keyword = search.getSearchCondition();
		String value = search.getSearchValue();
		if(keyword.equals("title") && value!="") {
			store.insertKeyword(search);
		}
	}
	
	//인기키워드 출력
	@Override
	public List<Keyword> printPopKeyword() {
		return store.selectPopKeyword();
	}

}
