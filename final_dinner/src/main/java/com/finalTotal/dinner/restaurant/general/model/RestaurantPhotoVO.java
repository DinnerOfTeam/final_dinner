package com.finalTotal.dinner.restaurant.general.model;

import java.sql.Timestamp;

public class RestaurantPhotoVO {
	private int resPhotoNo;
	private int resNo;
	private String resPhotoName;
	private String photoOriginalName;
	private String resPhotoTitle;
	private String resPhotoDesc;
	private Timestamp resPhotoRegdate;
	
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
