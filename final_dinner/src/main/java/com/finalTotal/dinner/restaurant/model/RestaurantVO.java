package com.finalTotal.dinner.restaurant.model;

import java.sql.Timestamp;

public class RestaurantVO {
	private int resNo;	//식당번호(시퀀스)
	private int memNo;	//회원번호
	private int foodTypeNno; //음식종류번호
	private int resTypeNo; //식당 종류번호 
	private String resName; //식당이름
	private String resIntroduce; //소개
	private String resWork_day; //영업일
	private String resWork_hour; //영업시간
	private String resThumbnail; //썸네일(이미지 경로)-fileName과 같음
	private int resGrade; //평점(0.0~5.0) 0.5단위
	private int resMaxPerson; //최대인원(예약가능한 최대인원)
	private String resContact;	//연락처
	private String resZipcode; //우편번호
	private String resAddress; //주소
	private String resAddressDetail; //상세주소
	private Timestamp resRegdate; //등록일
	private String resStatus; //상태(승인대기중,승인됨,차단됨)

	public RestaurantVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantVO(int resNo, int memNo, int foodTypeNno, int resTypeNo, String resName, String resIntroduce,
			String resWork_day, String resWork_hour, String resThumbnail, int resGrade, int resMaxPerson,
			String resContact, String resZipcode, String resAddress, String resAddressDetail, Timestamp resRegdate,
			String resStatus) {
		super();
		this.resNo = resNo;
		this.memNo = memNo;
		this.foodTypeNno = foodTypeNno;
		this.resTypeNo = resTypeNo;
		this.resName = resName;
		this.resIntroduce = resIntroduce;
		this.resWork_day = resWork_day;
		this.resWork_hour = resWork_hour;
		this.resThumbnail = resThumbnail;
		this.resGrade = resGrade;
		this.resMaxPerson = resMaxPerson;
		this.resContact = resContact;
		this.resZipcode = resZipcode;
		this.resAddress = resAddress;
		this.resAddressDetail = resAddressDetail;
		this.resRegdate = resRegdate;
		this.resStatus = resStatus;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getFoodTypeNno() {
		return foodTypeNno;
	}

	public void setFoodTypeNno(int foodTypeNno) {
		this.foodTypeNno = foodTypeNno;
	}

	public int getResTypeNo() {
		return resTypeNo;
	}

	public void setResTypeNo(int resTypeNo) {
		this.resTypeNo = resTypeNo;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResIntroduce() {
		return resIntroduce;
	}

	public void setResIntroduce(String resIntroduce) {
		this.resIntroduce = resIntroduce;
	}

	public String getResWork_day() {
		return resWork_day;
	}

	public void setResWork_day(String resWork_day) {
		this.resWork_day = resWork_day;
	}

	public String getResWork_hour() {
		return resWork_hour;
	}

	public void setResWork_hour(String resWork_hour) {
		this.resWork_hour = resWork_hour;
	}

	public String getResThumbnail() {
		return resThumbnail;
	}

	public void setResThumbnail(String resThumbnail) {
		this.resThumbnail = resThumbnail;
	}

	public int getResGrade() {
		return resGrade;
	}

	public void setResGrade(int resGrade) {
		this.resGrade = resGrade;
	}

	public int getResMaxPerson() {
		return resMaxPerson;
	}

	public void setResMaxPerson(int resMaxPerson) {
		this.resMaxPerson = resMaxPerson;
	}

	public String getResContact() {
		return resContact;
	}

	public void setResContact(String resContact) {
		this.resContact = resContact;
	}

	public String getResZipcode() {
		return resZipcode;
	}

	public void setResZipcode(String resZipcode) {
		this.resZipcode = resZipcode;
	}

	public String getResAddress() {
		return resAddress;
	}

	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}

	public String getResAddressDetail() {
		return resAddressDetail;
	}

	public void setResAddressDetail(String resAddressDetail) {
		this.resAddressDetail = resAddressDetail;
	}

	public Timestamp getResRegdate() {
		return resRegdate;
	}

	public void setResRegdate(Timestamp resRegdate) {
		this.resRegdate = resRegdate;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}

	@Override
	public String toString() {
		return "RestaurantVO [resNo=" + resNo + ", memNo=" + memNo + ", foodTypeNno=" + foodTypeNno + ", resTypeNo="
				+ resTypeNo + ", resName=" + resName + ", resIntroduce=" + resIntroduce + ", resWork_day=" + resWork_day
				+ ", resWork_hour=" + resWork_hour + ", resThumbnail=" + resThumbnail + ", resGrade=" + resGrade
				+ ", resMaxPerson=" + resMaxPerson + ", resContact=" + resContact + ", resZipcode=" + resZipcode
				+ ", resAddress=" + resAddress + ", resAddressDetail=" + resAddressDetail + ", resRegdate=" + resRegdate
				+ ", resStatus=" + resStatus + "]";
	}
	
	
	
	
}
