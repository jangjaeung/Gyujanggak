package com.daol.library.studyRoom.service;

import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

public interface StudyRoomService {

	// 스터디룸 예약
	public int reservationStudyRoom(StudyRoom studyRoom);
	// 스터디룸 예약 취소
	public int cancleStudyRoom(StudyRoom studyRoom);

}
