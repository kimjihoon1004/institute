package com.eugene.st.item;

public class StudentItem {
	/*
	 * stDate변수 학생의 생일을 의미합니다.
	 * stMemo는 학생정보의 비고란을 의미합니다.
	 */
	private int stId;
	private int stFee; // 학생이 납부 해야 할 원비 금
	private String stPhone;
	private String stName;
	private String stSchool;
	private String stParents;
	private String stDate; // 학생이 학원에 등록한 날짜
	private String stGender;
	private String stAddress;
	private String stMemo;
	private String stDateMemo; // 원비 납부 날짜가 임이로 변경될 경우
	
	
	
	// st_id
	public void setStId(int id) {
		stId = id;
	}
	public int getStId() {
		return stId;
	}
	
	// st_fee
	public int getStFee() {
		return stFee;
	}
	public void setStFee(int stFee) {
		this.stFee = stFee;
	}
	
	// st_date_memo
	public void setStDateMemo(String dateMemo)	{
		this.stDateMemo = dateMemo;
	}
	public String getStDateMemo()	{
		return this.stDateMemo;
	}
	
	// st_phone
	public void setStPhone(String phone) {
		stPhone = phone;
	}
	public String getStPhone() {
		return stPhone;
	}
	
	// st_name
	public void setStName(String name) {
		stName = name;
	}
	public String getStName() {
		return stName;
	}
	
	// st_school
	public void setStSchool(String school) {
		stSchool = school;
	}
	public String getStSchool() {
		return stSchool;
	}
	
	// st_parents
	public void setStParents(String parents) {
		stParents = parents;
	}
	public String getStParents() {
		return stParents;
	}
	
	// st_date
	public void setStDate(String date) {
		stDate = date;
	}
	public String getStDate() {
		return stDate;
	}
	
	// st_date
	public void setStGender(String gender) {
		stGender = gender;
	}
	public String getStGender() {
		return stGender;
	}
	
	// st_address
	public void setStAddress(String address) {
		stAddress = address;
	}
	public String getStAddress() {
		return stAddress;
	}
	
	// st_memo
	public void setStMemo(String memo) {
		stMemo = memo;
	}
	public String getStMemo() {
		return stMemo;
	}
}