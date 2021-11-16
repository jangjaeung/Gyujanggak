package com.daol.library.reservationBook.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.store.ReservationBookStore;

@Repository
public class ReservationBookStoreLogic implements ReservationBookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReservationBook> selectAllRsvBook(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

}
