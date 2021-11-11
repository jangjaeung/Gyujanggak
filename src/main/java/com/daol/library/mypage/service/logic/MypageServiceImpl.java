package com.daol.library.mypage.service.logic;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
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
	public int updatePayment(Member member) {
		int result = store.updatePayment(member);
		return result;
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


	//희망도서 신청 메일, 디비저장
	@Override
	public int registerWishBook(WishBook wishbook) {
		int result = store.insertWishBook(wishbook);
		return result;
	}

	//희망도서 내역조회
	@Override
	public List<WishBook> printWishBook(String userId) {
		List<WishBook> wList = store.selectWishBook(userId);
		return wList;
	}

	@Override
	public Book printLikeList(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReadingRoom> printAllrList(String userId) {
		List<ReadingRoom> rList = store.selectAllrList(userId);
		return rList;
	}

	@Override
	public List<StudyRoom> printAllsList(String userId) {
		List<StudyRoom> sList = store.selectAllsList(userId);
		return sList;
	}


	@Override
	public int cancelReadingRoom(int rReservationNo) {
		int result = store.deleteReadingRoom(rReservationNo);
		return result;
	}

	@Override
	public int cancelStudyRoom(int sReservationNo) {
		int result = store.deleteStudyRoom(sReservationNo);
		return result;
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
