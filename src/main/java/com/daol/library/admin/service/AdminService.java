package com.daol.library.admin.service;

import java.util.List;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.book.domain.Book;

public interface AdminService {

	public int getListCount();

	public List<Book> printAll(PageInfo pi);

}
