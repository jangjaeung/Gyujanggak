package com.daol.library.admin.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.domain.BookParcel;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Statistics;
import com.daol.library.admin.domain.Status;
import com.daol.library.admin.service.AdminService;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminStore store;

	// 회원관리 전체 조회
	@Override
	public List<Member> printAllMember(PageInfo pi) {
		List<Member> uList = store.selectAllMember(pi);
		return uList;
	}
	
	// 회원 카운트
	@Override
	public int getUserListCount() {
		int totalCount = store.selectUserListCount();
		return totalCount;
	}
	
	@Override
	// 장서 카운트
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	// 장서 리스트
	@Override
	public List<Book> printAll(PageInfo pi) {
		List<Book> bList = store.selectAll(pi);
		return bList;
	}
	// 장서 서치
	@Override
	public List<Book> printSearchAll(Search search) {
		List<Book> searchList = store.selectSearchAll(search);
		return searchList;
	}
	
	//유저타입 끌어오기용
	@Override
	public Member memberCk(String login) {
		return store.selectMemberCk(login);
	}
	
	//관리자-문의리스트 끌어오기
	@Override
	public List<Qna> printAllQna(PageInfo pi) {
		return store.selectAllQna(pi);
	}
	//페이지네이션용
	@Override
	public int getQnaListCount() {
		return store.selectQnaListCount();
	}

	// 장서 추가
	@Override
	public int enrollBook(Book book) {
		int result = store.insertAll(book);
		return result;
	}

	// 장서 삭제
	@Override
	public int bookDelete(int[] nums) {
		int result = store.deleteAll(nums);
		return result;
	}
	//관리자게시판 문의검색
	@Override
	public List<Qna> printSearchAll(Search search,PageInfo pi) {
		return store.selectSearchAll(search,pi);
	}
	//검색페이지네이션용
	@Override
	public int getSearchQnaListCount(Search search) {
		return store.selectSearchQnaListCount(search);
	}
	//문의상세
	@Override
	public Qna printOneQna(int qnaNo) {
		return store.selectOneQna(qnaNo);
	}
	//답변등록
	@Override
	public int modifyAnswer(Qna qna) {
		return store.updateAnswer(qna);
	}

	//희망도서 리스트
	@Override
	public List<WishBook> wishAll(PageInfo pi) {
		List<WishBook> bList = store.selectAllWish(pi);
		return bList;
	}
	//희망도서 페이징
	@Override
	public int getWishListCount() {
		int totalCount = store.selectWishListCount();
		return totalCount;
	}

	// status카운트
	@Override
	public int getStatusListCount() {
		int totalCount = store.selectStatusListCount();
		return totalCount;
	}
	// status 리스트
	@Override
	public List<Status> statusAll(PageInfo pi) {
		List<Status> bList = store.selectAllStatus(pi);
		return bList;
	}

	//신고게시물
	@Override
	public List<Post> printAllReportPost(PageInfo pi) {
		return store.selectAllReportPost(pi);
	}
	//신고게시물 카운트
	@Override
	public int getPostReportCount() {
		return store.selectPostReportCount();
	}
	//신고된 댓글 카운트
	@Override
	public int getReplyReportCount() {
		return store.selectReplyReportCount();
	}
	//신고된 댓글 리스트
	@Override
	public List<Reply> printAllReportReply(PageInfo rpi) {
		return store.selectAllReportReply(rpi);
	}

	// 반납 후 상태변경
	@Override
	public void bookState(int bookNo) {
		store.updateBookState(bookNo);
		
	}
	// 반납 후 권수변경
	@Override
	public void lendingCopy(String userId) {
		store.updateLending(userId);
		
	}

	// 반납일변경
	@Override
	public int dateUpdate(int lendingNo) {
		int result = store.updateDate(lendingNo);
		return result;
	}

	// 희망도서수정
	@Override
	public void updateWishBook(int applyNo) {
		store.wishBookUpdate(applyNo);
	}

	// 택배리스트 카운트
	@Override
	public int getParcelListCount() {
		int totalCount = store.selectParcelListCount();
		return totalCount;
	}
	// 택배리스트
	@Override
	public List<BookParcel> parcelAll(PageInfo pi) {
		List<BookParcel> bList = store.selectAllParacel(pi);
		return bList;
	}

	// 택배 완료처리
	@Override
	public int parcelUpdate(String deliveryNo) {
		int result = store.updateParcel(deliveryNo);
		return result;
	}

	// 택배 완료
	@Override
	public Book bookinfoUpdate(String bookNo) {
		Book books = store.selectBookInfo(bookNo);
		return books;
	}
	// 대출 통계
	@Override
	public List<Statistics> statisAll() {
		List<Statistics> sList = store.selectAllstatis();
		return sList;
	}
}
