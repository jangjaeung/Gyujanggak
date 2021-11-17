package com.daol.library.reservationBook.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.store.ReservationBookStore;

@Repository
public class ReservationBookStoreLogic implements ReservationBookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReservationBook> selectAllRsvBook(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("rsvBookMapper.selectAllRsvBook", userId, rowBounds);
	}

	@Override
	public List<ReservationBook> selectAddCheck(ReservationBook reservationBook) {
		return sqlSession.selectList("rsvBookMapper.addCheck", reservationBook);
	}
	
	@Override
	public int insertRsv(ReservationBook reservationBook) {
		return sqlSession.insert("rsvBookMapper.insertRsv", reservationBook);
	}

	@Override
	public int deleteRsv(ReservationBook reservationBook) {
		return sqlSession.delete("rsvBookMapper.deleteRsv", reservationBook);
	}

	@Override
	public int updateRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount(String userId) {
		return sqlSession.selectOne("rsvBookMapper.selectListCount", userId);
	}

}
