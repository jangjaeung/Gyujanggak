package com.daol.library.admin.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.service.AdminService;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminStore store;

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public List<Book> printAll(PageInfo pi) {
		List<Book> bList = store.selectAll(pi);
		return bList;
	}
}
