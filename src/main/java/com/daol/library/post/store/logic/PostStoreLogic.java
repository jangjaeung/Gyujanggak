package com.daol.library.post.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.store.PostStore;

@Repository
public class PostStoreLogic implements PostStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public int selectListCount() {
		int totalCount = session.selectOne("postMapper.selectCount");
		return totalCount;
	}

	@Override
	public List<Post> selectPrintAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		List<Post> pList = session.selectList("postMapper.selectListAll",pi, rowBounds);
		return pList;
	}

	@Override
	public int insertReadCount(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post selectPrintOne(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePost(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> selectAllReply(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
