package com.daol.library.admin.store;

import java.util.List;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Status;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

public interface AdminStore {
	public int selectListCount();

	public List<Book> selectAll(PageInfo pi);
	//유저타입 끌어오기
	public Member selectMemberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> selectAllQna(PageInfo pi);
	//페이징처리용
	public int selectQnaListCount();

	public List<Book> selectSearchAll(Search search);

	public int insertAll(Book book);

	public int deleteAll(int[] nums);
	//검색
	public List<Qna> selectSearchAll(Search search,PageInfo pi);
	//검색 페이징 처리
	public int selectSearchQnaListCount(Search search);
	//문의상세
	public Qna selectOneQna(int qnaNo);
	//문의등록
	public int updateAnswer(Qna qna);

	public List<WishBook> selectAllWish(PageInfo pi);

	// 희망도서 페이징
	public int selectWishListCount();

	public int selectStatusListCount();

	public List<Status> selectAllStatus(PageInfo pi);

	
	//신고된 게시물 리스트
	public List<Post> selectAllReportPost(PageInfo pi);
	//신고된게시물카운트
	public int selectPostReportCount();
	//신고된 댓글 카운트
	public int selectReplyReportCount();
	//신고된 댓글 리스트
	public List<Reply> selectAllReportReply(PageInfo rpi);
}
