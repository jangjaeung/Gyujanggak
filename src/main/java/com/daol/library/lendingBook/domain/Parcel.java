package com.daol.library.lendingBook.domain;

public class Parcel {
	private int deliveryNo;
	private int lendingNo;
	private String arddr;
	private String dStatus;
	
	public Parcel() {}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getLendingNo() {
		return lendingNo;
	}

	public void setLendingNo(int lendingNo) {
		this.lendingNo = lendingNo;
	}

	public String getArddr() {
		return arddr;
	}

	public void setArddr(String arddr) {
		this.arddr = arddr;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	@Override
	public String toString() {
		return "Parcel [deliveryNo=" + deliveryNo + ", lendingNo=" + lendingNo + ", arddr=" + arddr + ", dStatus="
				+ dStatus + "]";
	}
	
}
