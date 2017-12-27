package com.finalTotal.dinner.book.model;

import java.util.Date;

public class BookVO {
	private int bookNo;	//예약번호
	private int memNo;	//회원번호
	private int resNo;	//식당번호
	private Date bookDate;	//예약날짜
	private Date bookRegdate; //예약등록날짜
	private int bookNum;  //인원수
	private String bookCheck; //승인여부
	private String resAddress; //예약정보 볼때 필요한 식당 주소
	private String resName;
	
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookVO(int bookNo, int memNo, int resNo, Date bookDate, Date bookRegdate, int bookNum, String bookCheck,
			String resAddress, String resName) {
		super();
		this.bookNo = bookNo;
		this.memNo = memNo;
		this.resNo = resNo;
		this.bookDate = bookDate;
		this.bookRegdate = bookRegdate;
		this.bookNum = bookNum;
		this.bookCheck = bookCheck;
		this.resAddress = resAddress;
		this.resName = resName;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public Date getBookRegdate() {
		return bookRegdate;
	}

	public void setBookRegdate(Date bookRegdate) {
		this.bookRegdate = bookRegdate;
	}

	public int getBookNum() {
		return bookNum;
	}

	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}

	public String getBookCheck() {
		return bookCheck;
	}

	public void setBookCheck(String bookCheck) {
		this.bookCheck = bookCheck;
	}

	public String getResAddress() {
		return resAddress;
	}

	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	@Override
	public String toString() {
		return "BookVO [bookNo=" + bookNo + ", memNo=" + memNo + ", resNo=" + resNo + ", bookDate=" + bookDate
				+ ", bookRegdate=" + bookRegdate + ", bookNum=" + bookNum + ", bookCheck=" + bookCheck + ", resAddress="
				+ resAddress + ", resName=" + resName + "]";
	}

	

	

	
	
}
