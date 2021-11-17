package com.daol.library.reservationBook.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;
import com.daol.library.reservationBook.store.ReservationBookStore;

@Service
public class ReservationBookServiceImpl implements ReservationBookService {
	@Autowired
	private ReservationBookStore store;

	@Override
	public List<ReservationBook> printAllRsvBook(PageInfo pi, String userId) {
		return store.selectAllRsvBook(pi, userId);
	}

	@Override
	public List<ReservationBook> printAddCheck(ReservationBook reservationBook) {
		return store.selectAddCheck(reservationBook);
	}

	@Override
	public int registerRsv(ReservationBook reservationBook) {
		return store.insertRsv(reservationBook);
	}

	@Override
	public int removeRsv(ReservationBook reservationBook) {
		return store.deleteRsv(reservationBook);
	}

	@Override
	public int modifyRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount(String userId) {
		return store.selectListCount(userId);
	}

}
