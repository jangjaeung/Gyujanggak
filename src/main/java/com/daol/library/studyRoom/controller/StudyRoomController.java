package com.daol.library.studyRoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;
import com.daol.library.studyRoom.service.StudyRoomService;

@Controller
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;

	// 스터디룸 메인 화면
	@RequestMapping(value = "studyRoom.do", method = RequestMethod.GET)
	public String readingRoomView() {
		return "studyRoom/studyRoomMain";
	}
	
	// 스터디룸 예약
	@ResponseBody
	@RequestMapping(value = "reservationStudyRoom.do", method = RequestMethod.POST)
	public String reservationStudyRoom(@ModelAttribute StudyRoom studyRoom) {
		int result = service.reservationStudyRoom(studyRoom);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 예약 취소
	@ResponseBody
	@RequestMapping(value="cancleStudyRoom.", method=RequestMethod.GET)
	public String cancleStudyRoom(@ModelAttribute StudyRoom studyRoom) {
		int result = service.cancleStudyRoom(studyRoom);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
