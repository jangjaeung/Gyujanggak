package com.daol.library.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Status;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

@Repository
public class AdminStoreLogic implements AdminStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//유저타입 끌어오기용
	@Override
	public Member selectMemberCk(String login) {
		return sqlSession.selectOne("adminMapper.selectUser",login);
	}

	//관리자-문의 리스트 끌어오기
	@Override
	public List<Qna> selectAllQna(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectAllQna",pi,rowBounds);
	}
	//qna 페이지네이션용
	@Override
	public int selectQnaListCount() {
		return sqlSession.selectOne("adminMapper.selectQnaListCount");
	}
	
	

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("adminMapper.selectListCount");
		return count;
	}
	
	@Override
	public List<Book> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Book> bList = sqlSession.selectList("adminMapper.selectBookList",pi,rowBounds);
		return bList;
	}
	@Override
	public List<Book> selectSearchAll(Search search) {
		List<Book> searchList = sqlSession.selectList("adminMapper.selectSearchList", search);
		return searchList;
	}

	@Override
	public int insertAll(Book book) {
		int result = sqlSession.insert("adminMapper.insertBook", book);
		return result;
	}

	@Override
	public int deleteAll(int[] nums) {
//		String params = "";
//		
//		for(int i =0; i<nums.length; i++) {
//			params += nums[i];
//			
//			if(i < nums.length-1)
//				params += ",";
//		}
		int result = sqlSession.delete("adminMapper.deleteBook", nums);
		return result;
	}
	//관리자게시판 문의 검색
	@Override
	public List<Qna> selectSearchAll(Search search,PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectSearchQna",search,rowBounds);
	}
	//문의관리 검색페이징용
	@Override
	public int selectSearchQnaListCount(Search search) {
		return sqlSession.selectOne("adminMapper.getSearchCount",search);
	}
	//문의관리 답변하러갑시다
	@Override
	public Qna selectOneQna(int qnaNo) {
		return sqlSession.selectOne("adminMapper.selectOneQna",qnaNo);
	}
	//문의등록
	@Override
	public int updateAnswer(Qna qna) {
		return sqlSession.update("adminMapper.updateQna",qna);
	}
	//희망 도서 목록
	@Override
	public List<WishBook> selectAllWish(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<WishBook> bList = sqlSession.selectList("adminMapper.wishBookList",pi,rowBounds);
		return bList;
	}

	@Override
	public int selectWishListCount() {
		int count = sqlSession.selectOne("adminMapper.selectWishListCount");
		return count;
	}

	@Override
	public int selectStatusListCount() {
		int count = sqlSession.selectOne("adminMapper.selectStatusListCount");
		return count;
	}

	@Override
	public List<Status> selectAllStatus(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Status> bList = sqlSession.selectList("adminMapper.StatusBookList",pi,rowBounds);
		return bList;
	}

	//신고게시물리스트
	@Override
	public List<Post> selectAllReportPost(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("postMapper.selectAllReportPost",rowBounds);
	}
	//신고게시물카운트
	@Override
	public int selectPostReportCount() {
		return sqlSession.selectOne("postMapper.selectPostReportCount");
	}
	//신고된 댓글 카운트
	@Override
	public int selectReplyReportCount() {
		return sqlSession.selectOne("postMapper.selectReplyReportCount");
	}
	//신고된 댓글 리스트
	@Override
	public List<Reply> selectAllReportReply(PageInfo rpi) {
		int offset = (rpi.getCurrentPage() -1) * rpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		return sqlSession.selectList("postMapper.selectAllReportReply",rowBounds);
	}

}
