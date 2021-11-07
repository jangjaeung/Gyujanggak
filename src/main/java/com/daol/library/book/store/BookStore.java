package com.daol.library.book.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Search;

public interface BookStore {
	public List<Book> selectAll();
	public Book selectOne(int bookNo);
	public List<Book> selectSearchSimple(Search search);
	public List<Book> selectSearchDetail(Search search);
	public List<Book> selectSearchSub(Search search);
	public List<Book> selectSearchNew();
	
}
