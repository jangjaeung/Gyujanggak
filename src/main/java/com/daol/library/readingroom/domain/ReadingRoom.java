package com.daol.library.readingroom.domain;

import java.sql.Date;

public class ReadingRoom {
	private int rReservationNo;
	private String userId;
	private Date rReservationDate;
	private String rReservationTime;
	private String seatNo;
	
	public int getrReservationNo() {
		return rReservationNo;
	}
	public void setrReservationNo(int rReservationNo) {
		this.rReservationNo = rReservationNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getrReservationDate() {
		return rReservationDate;
	}
	public void setrReservationDate(Date rReservationDate) {
		this.rReservationDate = rReservationDate;
	}
	public String getrReservationTime() {
		return rReservationTime;
	}
	public void setrReservationTime(String rReservationTime) {
		this.rReservationTime = rReservationTime;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	@Override
	public String toString() {
		return "ReadingRoom [예약번호=" + rReservationNo + ", 아이디=" + userId + ", 예약일="
				+ rReservationDate + ", 예약시간=" + rReservationTime + ", 좌석번호=" + seatNo + "]";
	}
	
	
}
