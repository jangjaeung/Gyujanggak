package com.daol.library.readingRoom.store;

import java.util.List;

import com.daol.library.readingRoom.domain.ReadingRoom;

public interface ReadingRoomStore {

	// 열람실 현황
	public List<ReadingRoom> printAllReadingRoom(String strNowDate);
	// 마이페이지 - 열람실 예약 조회
	public ReadingRoom printOneReadingRoom(int rReservationNo);
	// 열람실 예약
	public int insertReadingRoom(ReadingRoom readingRoom);
	// 열람실 예약 취소
	public int deleteReadingRoom(ReadingRoom readingRoom);
	
}
