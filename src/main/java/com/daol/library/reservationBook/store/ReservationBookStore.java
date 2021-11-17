package com.daol.library.reservationBook.store;

import java.util.List;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.reservationBook.domain.ReservationBook;

public interface ReservationBookStore {
	public List<ReservationBook> selectAllRsvBook(PageInfo pi, String userId);
	public List<ReservationBook> selectAddCheck(ReservationBook reservationBook);
	public int insertRsv(ReservationBook reservationBook);
	public int deleteRsv(ReservationBook reservationBook);
	public int updateRsv(ReservationBook reservationBook);
//	페이징 처리
	public int selectListCount(String userId);
}
