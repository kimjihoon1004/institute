package com.eugene.fee.item;

public class FeeItem {
	private int feeId;
	private int stId;
	private String stName;
	private String feeDate;
	private int fee;
	
	public int getFeeId() {
		return this.feeId;
	}
	public void setFeeId(int id) {
		this.feeId = id;
	}
	
	public int getStId() {
		return this.stId;
	}
	public void setStId(int id) {
		this.stId = id;
	}
	
	public String getStName() {
		return this.stName;
	}
	public void setStName(String name) {
		this.stName = name;
	}
	
	public String getFeeDate() {
		return this.feeDate;
	}
	public void setFeeDate(String date) {
		this.feeDate = date;
	}
	
	public int getFee() {
		return this.fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	
}
