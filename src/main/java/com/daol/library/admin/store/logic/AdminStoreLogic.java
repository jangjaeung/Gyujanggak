package com.daol.library.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;

@Repository
public class AdminStoreLogic implements AdminStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//유저타입 끌어오기용
	@Override
	public Member selectMemberCk(String login) {
		return sqlSession.selectOne("adminMapper.selectUser",login);
	}

	//관리자-문의 리스트 끌어오기
	@Override
	public List<Qna> selectAllQna(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectAllQna",pi,rowBounds);
	}
	//qna 페이지네이션용
	@Override
	public int selectQnaListCount() {
		return sqlSession.selectOne("adminMapper.selectCount");
	}
	
	

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("adminMapper.selectQnaListCount");
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
