package com.daol.library.post.service;

import java.util.List;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;

public interface PostService {

		public int getListCount();
		public List<Post> printAll(PageInfo pi);
		public int addReadCount(int postNo);
		public Post printOne(int postNo);
		public int registerPost(Post post);
		public int modifyPost(Post post);
		public int removePost(int postNo);
		
		public List<Post> printAllReply(int postNo);
		public int registerReply(Post post);
		public int modifyReply(Post post);
		public int removeReply(Post post);
}
