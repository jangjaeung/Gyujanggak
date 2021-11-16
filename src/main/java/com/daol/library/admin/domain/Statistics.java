package com.daol.library.admin.domain;

public class Statistics {

	private String bookSubject;
	private int lendingCount;
	private String lendingDate;
	
	public Statistics() {}

	public String getBookSubject() {
		return bookSubject;
	}

	public void setBookSubject(String bookSubject) {
		this.bookSubject = bookSubject;
	}

	public int getLendingCount() {
		return lendingCount;
	}

	public void setLendingCount(int lendingCount) {
		this.lendingCount = lendingCount;
	}

	public String getLendingDate() {
		return lendingDate;
	}

	public void setLendingDate(String lendingDate) {
		this.lendingDate = lendingDate;
	}

	@Override
	public String toString() {
		return "Statistics [bookSubject=" + bookSubject + ", lendingCount=" + lendingCount + ", lendingDate="
				+ lendingDate + "]";
	}
	
	
}
