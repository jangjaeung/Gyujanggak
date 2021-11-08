package com.daol.library.notice.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;
import com.daol.library.notice.service.NoticeService;
import com.daol.library.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeStore store;

	@Override
	public List<Notice> printAll(PageInfo pi) {
		List<Notice> nList = store.selectAll(pi);
		return nList;
	}

	@Override
	public int registerNotice(Notice notice) {
		int result = store.insertNotice(notice);
		return result;
	}

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}
}
