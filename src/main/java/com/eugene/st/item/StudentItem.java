package com.eugene.st.item;

public class StudentItem {
	/*
	 * stDate변수 학생의 생일을 의미합니다.
	 * stMemo는 학생정보의 비고란을 의미합니다.
	 */
	private String stPhone;
	private String stName;
	private String stSchool;
	private String stParents;
	private String stDate;
	private String stGender;
	private String stAddress;
	private String stMemo;
	// stPrePhone는 st 테이블 update시 기존의 st stPhone값을 갖고있는 값 입니다.
	private String stPrePhone;
	
	public void setStPhone(String phone) {
		stPhone = phone;
	}
	public String getStPhone() {
		return stPhone;
	}
	
	public void setStName(String name) {
		stName = name;
	}
	public String getStName() {
		return stName;
	}
	
	public void setStSchool(String school) {
		stSchool = school;
	}
	public String getStSchool() {
		return stSchool;
	}
	
	public void setStParents(String parents) {
		stParents = parents;
	}
	public String getStParents() {
		return stParents;
	}
	
	public void setStDate(String date) {
		stDate = date;
	}
	public String getStDate() {
		return stDate;
	}
	
	public void setStGender(String gender) {
		stGender = gender;
	}
	public String getStGender() {
		return stGender;
	}
	
	public void setStAddress(String address) {
		stAddress = address;
	}
	public String getStAddress() {
		return stAddress;
	}
	
	public void setStMemo(String memo) {
		stMemo = memo;
	}
	public String getStMemo() {
		return stMemo;
	}
	
	public void setStPrePhone(String prePhone) {
		stPrePhone = prePhone;
	}
	public String getStPrePhone() {
		return stPrePhone;
	}
}
