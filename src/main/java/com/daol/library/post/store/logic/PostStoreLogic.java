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
	public int updateReadCount(int postNo) {
		int result = session.update("postMapper.updateReadCount",postNo);
		return result;
	}

	@Override
	public Post selectPrintOne(int postNo) {
		Post post = session.selectOne("postMapper.selectOnePost",postNo);
		return post;
	}

	@Override
	public int insertPost(Post post) {
		int result = session.insert("postMapper.insertPost",post);
		return result;
	}

	@Override
	public int updatePost(Post post) {
		int result = session.update("postMapper.updatePost",post);
		return result;
	}

	@Override
	public int deletePost(int postNo) {
		int result = session.delete("postMapper.deletePost",postNo);
		return result;
	}

	@Override
	public List<Post> selectAllReply(int postNo) {
		List<Post> pList = session.selectList("postMapper.selectAllReply",postNo);
		return pList;
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
