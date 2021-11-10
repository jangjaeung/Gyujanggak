package com.daol.library.mypage.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

public interface MypageStore {
	//회원정보 관리
		public Member selectOneInfo(Member member);
		
		/** 연회비 결제 */
		public int updatePayment(String userId);
		
		public int updateMember(Member member);
		
		public int deleteMember(Member member);
		
		public int checkPwdDup(Member member);
		
		//도서
		/** 대출 도서 전체 권수 */
		public int selectListCount();
		/** 대출 내역 */
		public List<Book> selectAllHistory(PageInfo pi);
		/** 서평 조회 */
		public int selectOneReview(Review review);
		/** 서평 등록 */
		public int insertReview(Review review);
		/** 서평 수정 */
		public int udpateReview(Review review);
		/** 서평 삭제 */
		public int deleteReview(Review review);
		/** 예약 내역 */
		public Book selectBookingHistory(Book book);
		/** 예약 취소 */
		public int deleteBooking(int bookNo);
		/** 희망 도서 내역 */
		public List<WishBook> selectWishBook(String userId);
		
		//희망도서 
		public int insertWishBook(WishBook wishBook);
		
		public Book selectLikeList(Book book);
		
		//취향 분석
		
		
		//시설 이용
		public List<ReadingRoom> selectAllrList(String userId);
		public List<StudyRoom> selectAllsList(String userId);
		/** 예약 취소 */
		public int deleteReadingRoom(int rReservationNo);
		/** 예약 취소 */
		public int deleteStudyRoom(int sReservationNo);

		
		
		//문의
		public List<Qna> selectAllQna(String userId);
		public Qna selectOneQna(int qnaNo);
		public int insertQna(Qna qna);
		public int updateQna(Qna qna);
		public int deleteQna(int qnaNo);
}
