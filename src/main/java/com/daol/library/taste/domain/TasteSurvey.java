package com.daol.library.taste.domain;

import java.sql.Date;

public class TasteSurvey {
	private String userId;
	private int bookNo;
	private String bookName;
	private String bookSubjecet;
	private String theme;
	private Date surveyDate;
	
	public TasteSurvey() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookSubjecet() {
		return bookSubjecet;
	}

	public void setBookSubjecet(String bookSubjecet) {
		this.bookSubjecet = bookSubjecet;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	@Override
	public String toString() {
		return "TasteSurvey [회원 아이디 =" + userId + ", 도서 번호 =" + bookNo + ", 도서 제목 =" + bookName + ", 주제 ="
				+ bookSubjecet + ", 테마 =" + theme + ", 설문일자 =" + surveyDate + "]";
	}
	
	
}
