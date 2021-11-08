package com.daol.library.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;
import com.daol.library.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Notice> nList = sqlSession.selectList("noticeMapper.selectNoticeList", pi, rowBounds);
		return nList;
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("noticeMapper.selectListCount");
		return count;
	
	}
}
