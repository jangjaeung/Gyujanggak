package com.daol.library.studyRoom.store;

import com.daol.library.studyRoom.domain.StudyRoom;

public interface StudyRoomStore {

	// 스터디룸 예약
	public int insertStudyRoom(StudyRoom studyRoom);
	// 스터디룸 예약 취소
	public int deleteStudyRoom(StudyRoom studyRoom);
}
