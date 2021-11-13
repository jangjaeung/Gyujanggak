package com.daol.library.mypage.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
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
	public int updatePayment(Member member) {
		int result = sqlSession.update("mypageMapper.updatePayment", member);
		return result;
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

	/** 전체 게시물 갯수 */
	@Override
	public int selectListCount(String userId) {
		int count = sqlSession.selectOne("mypageMapper.selectListCount", userId);
		return count;
	}

	@Override
	public List<Book> selectAllLendingHistory(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); //한 페이지당 보여줄 게시물 갯수
		List<Book> lendingList = sqlSession.selectList("mypageMapper.selectAllLendingHistory", userId, rowBounds);
		return lendingList;
	}

	@Override
	public Review selectOneReview(int bookNo) {
		Review review = sqlSession.selectOne("mypageMapper.selectOneReview", bookNo);
		return review;
	}

	@Override
	public int insertReview(Review review) {
		int result = sqlSession.insert("mypageMapper.insertReview", review);
		return result;
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
	public int selectWishListCount(String userId) {
		int count = sqlSession.selectOne("mypageMapper.selectWishListCount", userId);
		return count;
	}
	
	@Override
	public List<WishBook> selectWishBook(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); //한 페이지당 보여줄 게시물 갯수
		List<WishBook> wList = sqlSession.selectList("mypageMapper.selectWishList",userId, rowBounds);
		return wList;
	}
	


	@Override
	public Book selectLikeList(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public int selectrListCount(String userId) {
		int count = sqlSession.selectOne("mypageMapper.selectrListCount", userId);
		return count;
	}

	@Override
	public int selectsListCount(String userId) {
		int count = sqlSession.selectOne("mypageMapper.selectsListCount", userId);
		return count;
	}
	
	
	@Override
	public List<ReadingRoom> selectAllrList(String userId) {
		List<ReadingRoom> rList = sqlSession.selectList("mypageMapper.selectReadingroomHistory",userId);
		return rList;
	}

	@Override
	public List<StudyRoom> selectAllsList(String userId) {
		List<StudyRoom> sList = sqlSession.selectList("mypageMapper.selectStudyroomHistory", userId);
		return sList;
	}


	@Override
	public int deleteReadingRoom(int rReservationNo) {
		int result = sqlSession.delete("mypageMapper.deleteReadingRoom", rReservationNo);
		return result;
	}

	@Override
	public int deleteStudyRoom(int sReservationNo) {
		int result = sqlSession.delete("mypageMapper.deleteStudyRoom", sReservationNo);
		return result;
	}

	@Override
	public List<Qna> selectAllQna(String userId) {
		return sqlSession.selectList("mypageMapper.selectAllQna",userId);
	}
	
	@Override
	public Qna selectOneQna(int qnaNo) {
		return sqlSession.selectOne("mypageMapper.selectOneQna",qnaNo);
	}

	@Override
	public int insertQna(Qna qna) {
		return sqlSession.insert("mypageMapper.insertQna",qna);
	}

	@Override
	public int updateQna(Qna qna) {
		return sqlSession.update("mypageMapper.updateQna",qna);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return sqlSession.delete("mypageMapper.deleteQna",qnaNo);
	}




}
