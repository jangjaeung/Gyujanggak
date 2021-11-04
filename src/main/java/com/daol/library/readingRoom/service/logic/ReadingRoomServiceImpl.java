package com.daol.library.readingRoom.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.readingRoom.service.ReadingRoomService;
import com.daol.library.readingRoom.store.ReadingRoomStore;

@Service
public class ReadingRoomServiceImpl implements ReadingRoomService {

	@Autowired
	private ReadingRoomStore store;
	
	@Override
	public List<ReadingRoom> printAllReadingRoom(String strNowDate) {
		List<ReadingRoom> result = store.printAllReadingRoom(strNowDate);
		return result;
	}

	@Override
	public ReadingRoom printOneReadingRoom(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reservationReadingRoom(ReadingRoom readingRoom) {
		int result = store.insertReadingRoom(readingRoom);
		return result;
	}

	@Override
	public int cancleReadingRoom(ReadingRoom readingRoom) {
		// TODO Auto-generated method stub
		return 0;
	}

}
