package com.daol.library.reservationBook.store;

import java.util.List;

import com.daol.library.reservationBook.domain.ReservationBook;

public interface ReservationBookStore {
	public List<ReservationBook> selectAllRsvBook(String userId);
	public List<ReservationBook> selectAddCheck(ReservationBook reservationBook);
	public int insertRsv(ReservationBook reservationBook);
	public int deleteRsv(ReservationBook reservationBook);
	public int updateRsv(ReservationBook reservationBook);
}
