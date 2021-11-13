package com.daol.library.book.service;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.Search;

public interface BookService {
	public List<Book> printAll();
	public Book printOne(int bookNo);
	public int modifyLendingBook(int bookNo) throws Exception;
	public List<Book> printSearchSimple(Search search);
	public List<Book> printSearchDetail(Search search);
	public List<Book> printSearchSub(Search search);
	public List<Book> printSearchNew();
	public List<Book> printBestBook();
	
	public List<Book> printNewBook();
	
	//인기키워드 적립용
	public void regiKeyword(Search search);
	//인기키워드 출력
	public List<Keyword> printPopKeyword();
	
}
