package com.daol.library.book.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.Search;
import com.daol.library.book.store.BookStore;

@Repository
public class BookStoreLogic implements BookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Book> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book selectOne(int bookNo) {
		Book book = sqlSession.selectOne("bookMapper.selectOne", bookNo);
		return book;
	}
	
	@Override
	public List<Book> selectSearchSimple(Search search) {
		List<Book> bList = sqlSession.selectList("bookMapper.selectSearchSimple", search);
		return bList;
	}

	@Override
	public List<Book> selectSearchDetail(Search search) {
		List<Book> bList = sqlSession.selectList("bookMapper.selectSearchDetail", search);
		return bList;
	}

	@Override
	public List<Book> selectSearchSub(Search search) {
		List<Book> bList = sqlSession.selectList("bookMapper.selectSearchSub", search);
		return bList;
	}

	@Override
	public List<Book> selectSearchNew() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateLendingBook(int bookNo) {
		int result = sqlSession.update("bookMapper.updateLendingBook", bookNo);
		return result;
	}
	
	//메인페이지 신간도서 출력
	@Override
	public List<Book> selectNewList() {
		List<Book> bList = sqlSession.selectList("bookMapper.selectPrintNew");
		return bList;
	}

	@Override
	public List<Book> selectBestBook() {
		List<Book> bList = sqlSession.selectList("bookMapper.selectBestBook");
		return bList;
	}
	//인기키워드 적립용
	@Override
	public void insertKeyword(Search search) {
		sqlSession.insert("bookMapper.insertKeyword",search);
	}
	//인기키워드 출력
	@Override
	public List<Keyword> selectPopKeyword() {
		return sqlSession.selectList("bookMapper.popKeyword");
	}
	
}
