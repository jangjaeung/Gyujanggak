package com.daol.library.book.common;

import com.daol.library.book.domain.PageInfo;

public class Pagenation {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int naviLimit = 5; // 페이지 수 (네비게이터)
		int boardLimit = 5; // 게시글 수
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, naviLimit, boardLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
