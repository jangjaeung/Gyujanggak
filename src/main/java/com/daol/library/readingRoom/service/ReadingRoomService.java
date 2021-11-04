package com.daol.library.readingRoom.service;

import java.util.List;

import com.daol.library.readingRoom.domain.ReadingRoom;

public interface ReadingRoomService {

	// 열람실 현황
	public List<ReadingRoom> printAllReadingRoom(String strNowDate);
	// 마이페이지 - 열람실 예약 조회
	public ReadingRoom printOneReadingRoom(String userId);
	// 열람실 예약
	public int reservationReadingRoom(ReadingRoom readingRoom);
	// 열람실 예약 취소
	public int cancleReadingRoom(ReadingRoom readingRoom);
	
}
