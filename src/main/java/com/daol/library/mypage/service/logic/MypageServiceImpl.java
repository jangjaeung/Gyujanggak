package com.daol.library.mypage.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.mypage.service.MypageService;
import com.daol.library.mypage.store.MypageStore;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageStore store;
	
	@Override
	public Member printOneInfo(Member member) {
		Member memberOne = store.selectOneInfo(member);
		return memberOne;
	}

	@Override
	public int payment(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyMember(Member member) {
		int result = store.updateMember(member);
		return result;
	}

	@Override
	public int removeMember(Member member) {
		int result = store.deleteMember(member);
		return result;
	}
	
	@Override
	public int checkPwdDup(Member member) {
		int result = store.checkPwdDup(member);
		return result;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Book> printAllHistory(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int printOneReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Book printBookingHistory(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int cancelBooking(int bookNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Book printWishBook(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book printLikeList(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReadingRoom printAll(ReadingRoom readingRoom) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyRoom printAll(StudyRoom studryRoom) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeReadingRoomHistory(int rReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeStudyRoomHistory(int sReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cancelReadingRoom(int rReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cancelStudyRoom(int sReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> printAllQna(String userId) {
		return store.selectAllQna(userId);
	}
	
	@Override
	public Qna printOneQna(int qnaNo) {
		return store.selectOneQna(qnaNo);
	}

	@Override
	public int registQna(Qna qna) {
		return store.insertQna(qna);
	}

	@Override
	public int modifyQna(Qna qna) {
		return store.updateQna(qna);
	}

	@Override
	public int removeQna(int qnaNo) {
		return store.deleteQna(qnaNo);
	}


}
