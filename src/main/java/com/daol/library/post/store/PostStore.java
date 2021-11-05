package com.daol.library.post.store;

import java.util.List;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;

public interface PostStore {

	public int selectListCount();
	public List<Post> selectPrintAll(PageInfo pi);
	public int insertReadCount(int postNo);
	public Post selectPrintOne(int postNo);
	public int insertPost(Post post);
	public int updatePost(Post post);
	public int deletePost(int postNo);
	
	public List<Post> selectAllReply(int postNo);
	public int insertReply(Post post);
	public int updateReply(Post post);
	public int deleteReply(Post post);
}
