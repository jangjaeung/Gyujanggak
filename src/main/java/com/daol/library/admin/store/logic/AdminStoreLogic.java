package com.daol.library.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;

@Repository
public class AdminStoreLogic implements AdminStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("adminMapper.selectListCount");
		return count;
	}

	@Override
	public List<Book> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Book> bList = sqlSession.selectList("adminMapper.selectBookList",pi,rowBounds);
		return bList;
	}

}
