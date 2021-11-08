package com.daol.library.studyRoom.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.studyRoom.domain.StudyRoom;
import com.daol.library.studyRoom.store.StudyRoomStore;

@Repository
public class StudyRoomStoreLogic implements StudyRoomStore {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertStudyRoom(StudyRoom studyRoom) {
		int result = sqlSession.insert("studyRoomMapper.insertStudyRoom", studyRoom);
		return result;
	}
}
