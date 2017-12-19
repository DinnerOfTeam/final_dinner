package com.finalTotal.dinner.restaurant.general.model;

import java.sql.Timestamp;

public class RestaurantVO {
	private int resNo;	//식당번호(시퀀스)
	private int memNo;	//회원번호
	private int foodTypeNo; //음식종류번호
	private int resTypeNo; //식당 종류번호 
	private String resName; //식당이름
	private String resIntroduce; //소개
	private String resWorkDay; //영업일
	private String resWorkHour; //영업시간
	private String resThumbnail; //썸네일(이미지 경로)-fileName과 같음
	private int resGrade; //평점(0.0~5.0) 0.5단위
	private int resMaxPerson; //최대인원(예약가능한 최대인원)
	private String resContact1;	//연락처1
	private String resContact2;	//연락처2
	private String resContact3;	//연락처3
	private String resZipcode; //우편번호
	private String resAddress; //주소
	private String resAddressDetail; //상세주소
	private Timestamp resRegdate; //등록일
	private String resStatus; //상태(승인대기중,승인됨,차단됨)
	
	public RestaurantVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantVO(int resNo, int memNo, int foodTypeNo, int resTypeNo, String resName, String resIntroduce,
			String resWorkDay, String resWorkHour, String resThumbnail, int resGrade, int resMaxPerson,
			String resContact1, String resContact2, String resContact3, String resZipcode, String resAddress,
			String resAddressDetail, Timestamp resRegdate, String resStatus) {
		super();
		this.resNo = resNo;
		this.memNo = memNo;
		this.foodTypeNo = foodTypeNo;
		this.resTypeNo = resTypeNo;
		this.resName = resName;
		this.resIntroduce = resIntroduce;
		this.resWorkDay = resWorkDay;
		this.resWorkHour = resWorkHour;
		this.resThumbnail = resThumbnail;
		this.resGrade = resGrade;
		this.resMaxPerson = resMaxPerson;
		this.resContact1 = resContact1;
		this.resContact2 = resContact2;
		this.resContact3 = resContact3;
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

	public int getFoodTypeNo() {
		return foodTypeNo;
	}

	public void setFoodTypeNo(int foodTypeNo) {
		this.foodTypeNo = foodTypeNo;
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

	public String getResWorkDay() {
		return resWorkDay;
	}

	public void setResWorkDay(String resWorkDay) {
		this.resWorkDay = resWorkDay;
	}

	public String getResWorkHour() {
		return resWorkHour;
	}

	public void setResWorkHour(String resWorkHour) {
		this.resWorkHour = resWorkHour;
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

	public String getResContact1() {
		return resContact1;
	}

	public void setResContact1(String resContact1) {
		this.resContact1 = resContact1;
	}

	public String getResContact2() {
		return resContact2;
	}

	public void setResContact2(String resContact2) {
		this.resContact2 = resContact2;
	}

	public String getResContact3() {
		return resContact3;
	}

	public void setResContact3(String resContact3) {
		this.resContact3 = resContact3;
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
		return "RestaurantVO [resNo=" + resNo + ", memNo=" + memNo + ", foodTypeNo=" + foodTypeNo + ", resTypeNo="
				+ resTypeNo + ", resName=" + resName + ", resIntroduce=" + resIntroduce + ", resWorkDay=" + resWorkDay
				+ ", resWorkHour=" + resWorkHour + ", resThumbnail=" + resThumbnail + ", resGrade=" + resGrade
				+ ", resMaxPerson=" + resMaxPerson + ", resContact1=" + resContact1 + ", resContact2=" + resContact2
				+ ", resContact3=" + resContact3 + ", resZipcode=" + resZipcode + ", resAddress=" + resAddress
				+ ", resAddressDetail=" + resAddressDetail + ", resRegdate=" + resRegdate + ", resStatus=" + resStatus
				+ "]";
	}

	
	
	
	
	
}
