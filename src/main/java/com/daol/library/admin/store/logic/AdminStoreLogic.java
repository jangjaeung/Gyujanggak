package com.daol.library.admin.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.admin.store.AdminStore;

@Repository
public class AdminStoreLogic implements AdminStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
