package com.daol.library.post.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.service.PostService;
import com.daol.library.post.store.PostStore;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostStore store;

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public List<Post> printAll(PageInfo pi) {
		List<Post> pList = store.selectPrintAll(pi);
		return pList;
	}

	@Override
	public int addReadCount(int postNo) {
		int result = store.updateReadCount(postNo);
		return result;
	}

	@Override
	public Post printOne(int postNo) {
		Post post = store.selectPrintOne(postNo);
		return post;
	}

	@Override
	public int registerPost(Post post) {
		int result = store.insertPost(post);
		return result;
	}

	@Override
	public int modifyPost(Post post) {
		int result = store.updatePost(post);
		return result;
	}

	@Override
	public int removePost(int postNo) {
		int result = store.deletePost(postNo);
		return result;
	}

	@Override
	public List<Post> printAllReply(int postNo) {
		List<Post> pList = store.selectAllReply(postNo);
		return pList;
	}

	@Override
	public int registerReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeReply(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
