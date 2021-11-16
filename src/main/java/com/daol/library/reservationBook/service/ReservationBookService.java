package com.daol.library.reservationBook.service;

import java.util.List;

import com.daol.library.reservationBook.domain.ReservationBook;

public interface ReservationBookService {
	public List<ReservationBook> printAllRsvBook(String userId);
	public List<ReservationBook> printAddCheck(ReservationBook reservationBook);
	public int registerRsv(ReservationBook reservationBook);
	public int removeRsv(ReservationBook reservationBook);
	public int modifyRsv(ReservationBook reservationBook);
}
