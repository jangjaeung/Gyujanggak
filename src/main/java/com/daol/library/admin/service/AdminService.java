package com.daol.library.admin.service;

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

public interface AdminService {
	public int getListCount();

	public List<Book> printAll(PageInfo pi);
	
	public List<Book> printSearchAll(Search search);

	//관리자페이지 유저타입 끌어오기
	public Member memberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> printAllQna(PageInfo pi);
	public int getQnaListCount();

	public int enrollBook(Book book);

	public int bookDelete(int[] nums);
	//관리자게시판 문의검색
	public List<Qna> printSearchAll(Search search,PageInfo pi);
	//검색페이징용
	public int getSearchQnaListCount(Search search);
	//qna상세
	public Qna printOneQna(int qnaNo);
	//답변등록
	public int modifyAnswer(Qna qna);

	// wishbook 전체목록
	public List<WishBook> wishAll(PageInfo pi);

	// wishbook total수
	public int getWishListCount();

	public int getStatusListCount();

	public List<Status> statusAll(PageInfo pi);


	//신고된 게시물 리스트 페이징용
	public int getPostReportCount();
	//신고된 게시물 리스트
	public List<Post> printAllReportPost(PageInfo pi);
	//신고된 댓글 리스트 페이징
	public int getReplyReportCount();
	//신고된 댓글 리스트
	public List<Reply> printAllReportReply(PageInfo rpi);
}
