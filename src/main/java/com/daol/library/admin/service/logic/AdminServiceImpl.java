package com.daol.library.admin.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
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

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public List<Book> printAll(PageInfo pi) {
		List<Book> bList = store.selectAll(pi);
		return bList;
	}
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

	@Override
	public int enrollBook(Book book) {
		int result = store.insertAll(book);
		return result;
	}

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

	@Override
	public int getStatusListCount() {
		int totalCount = store.selectStatusListCount();
		return totalCount;
	}

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
}
