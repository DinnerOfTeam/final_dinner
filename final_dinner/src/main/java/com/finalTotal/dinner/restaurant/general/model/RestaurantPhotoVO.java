package com.finalTotal.dinner.restaurant.general.model;

import java.sql.Timestamp;

public class RestaurantPhotoVO {
	private int resPhotoNo; //식당사진번호
	private int resNo;	//식당번호
	private String resPhotoName; //사진이름
	private String photoOriginalName; //사진실제이름
	private String resPhotoTitle; //이미지제목
	private String resPhotoDesc; //이미지설명
	private Timestamp resPhotoRegdate; //등록일
	
	public RestaurantPhotoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantPhotoVO(int resPhotoNo, int resNo, String resPhotoName, String photoOriginalName,
			String resPhotoTitle, String resPhotoDesc, Timestamp resPhotoRegdate) {
		super();
		this.resPhotoNo = resPhotoNo;
		this.resNo = resNo;
		this.resPhotoName = resPhotoName;
		this.photoOriginalName = photoOriginalName;
		this.resPhotoTitle = resPhotoTitle;
		this.resPhotoDesc = resPhotoDesc;
		this.resPhotoRegdate = resPhotoRegdate;
	}

	public int getResPhotoNo() {
		return resPhotoNo;
	}

	public void setResPhotoNo(int resPhotoNo) {
		this.resPhotoNo = resPhotoNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getResPhotoName() {
		return resPhotoName;
	}

	public void setResPhotoName(String resPhotoName) {
		this.resPhotoName = resPhotoName;
	}

	public String getPhotoOriginalName() {
		return photoOriginalName;
	}

	public void setPhotoOriginalName(String photoOriginalName) {
		this.photoOriginalName = photoOriginalName;
	}

	public String getResPhotoTitle() {
		return resPhotoTitle;
	}

	public void setResPhotoTitle(String resPhotoTitle) {
		this.resPhotoTitle = resPhotoTitle;
	}

	public String getResPhotoDesc() {
		return resPhotoDesc;
	}

	public void setResPhotoDesc(String resPhotoDesc) {
		this.resPhotoDesc = resPhotoDesc;
	}

	public Timestamp getResPhotoRegdate() {
		return resPhotoRegdate;
	}

	public void setResPhotoRegdate(Timestamp resPhotoRegdate) {
		this.resPhotoRegdate = resPhotoRegdate;
	}

	@Override
	public String toString() {
		return "RestaurantPhotoVO [resPhotoNo=" + resPhotoNo + ", resNo=" + resNo + ", resPhotoName=" + resPhotoName
				+ ", photoOriginalName=" + photoOriginalName + ", resPhotoTitle=" + resPhotoTitle + ", resPhotoDesc="
				+ resPhotoDesc + ", resPhotoRegdate=" + resPhotoRegdate + "]";
	}
	
	
}
