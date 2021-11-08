package com.daol.library.post.service;

import java.util.List;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

public interface PostService {

		public int getListCount();
		public List<Post> printAll(PageInfo pi);
		public int addReadCount(int postNo);
		public Post printOne(int postNo);
		public int registerPost(Post post);
		public int modifyPost(Post post);
		public int removePost(int postNo);
		
		public List<Post> printAllReply(int postNo);
		public int registerReply(Reply reply);
		public int modifyReply(Reply reply);
		public int removeReply(Reply reply);
}
