package com.daol.library.lendingBook.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.store.LendingBookStore;

@Repository
public class LendingBookStoreLogic implements LendingBookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LendingBook> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LendingBook selectOne(int lendingNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertLending(LendingBook lendingBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLending(int lendingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLending(LendingBook lendingBook) {
		// TODO Auto-generated method stub
		return 0;
	}

}
