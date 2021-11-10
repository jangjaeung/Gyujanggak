package com.daol.library.mypage.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.store.MypageStore;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

@Repository
public class MypageStoreLogic implements MypageStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOneInfo(Member member) {
		Member memberOne = sqlSession.selectOne("mypageMapper.selectMember", member);
		return memberOne;
	}

	@Override
	public int updatePayment(String userId) {
		
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		int result = sqlSession.update("mypageMapper.updateMember", member);
		return result;
	}

	@Override
	public int deleteMember(Member member) {
		int result = sqlSession.delete("mypageMapper.deleteMember", member);
		return result;
	}
	
	@Override
	public int checkPwdDup(Member member) {
		int result = sqlSession.selectOne("mypageMapper.checkPwdDup", member);
		return result;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Book> selectAllHistory(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectOneReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int udpateReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Book selectBookingHistory(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteBooking(int bookNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int insertWishBook(WishBook wishBook) {
		int result = sqlSession.insert("mypageMapper.insertWishbook", wishBook);
		return result;
	}
	
	@Override
	public List<WishBook> selectWishBook(String userId) {
		List<WishBook> wList = sqlSession.selectList("mypageMapper.selectWishList",userId);
		return wList;
	}

	@Override
	public Book selectLikeList(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReadingRoom selectAll(ReadingRoom readingRoom) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyRoom selectAll(StudyRoom studryRoom) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReadingRoomHistory(int rReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudyRoomHistory(int sReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReadingRoom(int rReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudyRoom(int sReservationNo) {
		// TODO Auto-generated method stub
		return 0;
	}




}
