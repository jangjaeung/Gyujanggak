package com.daol.library.admin.store;

import java.util.List;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.book.domain.Book;

public interface AdminStore {

	public int selectListCount();

	public List<Book> selectAll(PageInfo pi);

}
