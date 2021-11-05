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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post printOne(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerPost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyPost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removePost(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> printAllReply(int postNo) {
		// TODO Auto-generated method stub
		return null;
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
