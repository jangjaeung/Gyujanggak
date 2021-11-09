package com.daol.library.book.service;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Search;

public interface BookService {
	public List<Book> printAll();
	public Book printOne(int bookNo);
	public int modifyOne(Book book);
	public List<Book> printSearchSimple(Search search);
	public List<Book> printSearchDetail(Search search);
	public List<Book> printSearchSub(Search search);
	public List<Book> printSearchNew();
	
}
