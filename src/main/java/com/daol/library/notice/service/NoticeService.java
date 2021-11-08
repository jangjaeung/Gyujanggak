package com.daol.library.notice.service;

import java.util.List;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;

public interface NoticeService {

	public List<Notice> printAll(PageInfo pi);

	public int registerNotice(Notice notice);

	public int getListCount();

}
