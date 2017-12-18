package com.finalTotal.dinner.restaurant.model;

import java.sql.Timestamp;

public class RestaurantVO {
	private int res_no;	//식당번호
	private int mem_no;	//회원번호
	private int food_type_no; //음식종류번호
	private int res_type_no; //식당 종류번호 
	private String res_name; //이름
	private String res_introduce; //소개
	private String res_work_day; //영업일
	private String res_work_hour; //영업시간
	private String thumbnail; //썸네일
	private int res_grade; //평점
	private int res_max_person; //최대인원
	private String res_contact;	//연락처
	private String res_zipcode; //우편번호
	private String res_address; //주소
	private String res_address_detail; //상세주소
	private Timestamp res_regdate; //등록일
	private String res_status; //상태
	
	public RestaurantVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantVO(int res_no, int mem_no, int food_type_no, int res_type_no, String res_name,
			String res_introduce, String res_work_day, String res_work_hour, String thumbnail, int res_grade,
			int res_max_person, String res_contact, String res_zipcode, String res_address, String res_address_detail,
			Timestamp res_regdate, String res_status) {
		super();
		this.res_no = res_no;
		this.mem_no = mem_no;
		this.food_type_no = food_type_no;
		this.res_type_no = res_type_no;
		this.res_name = res_name;
		this.res_introduce = res_introduce;
		this.res_work_day = res_work_day;
		this.res_work_hour = res_work_hour;
		this.thumbnail = thumbnail;
		this.res_grade = res_grade;
		this.res_max_person = res_max_person;
		this.res_contact = res_contact;
		this.res_zipcode = res_zipcode;
		this.res_address = res_address;
		this.res_address_detail = res_address_detail;
		this.res_regdate = res_regdate;
		this.res_status = res_status;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getFood_type_no() {
		return food_type_no;
	}

	public void setFood_type_no(int food_type_no) {
		this.food_type_no = food_type_no;
	}

	public int getRes_type_no() {
		return res_type_no;
	}

	public void setRes_type_no(int res_type_no) {
		this.res_type_no = res_type_no;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_introduce() {
		return res_introduce;
	}

	public void setRes_introduce(String res_introduce) {
		this.res_introduce = res_introduce;
	}

	public String getRes_work_day() {
		return res_work_day;
	}

	public void setRes_work_day(String res_work_day) {
		this.res_work_day = res_work_day;
	}

	public String getRes_work_hour() {
		return res_work_hour;
	}

	public void setRes_work_hour(String res_work_hour) {
		this.res_work_hour = res_work_hour;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getRes_grade() {
		return res_grade;
	}

	public void setRes_grade(int res_grade) {
		this.res_grade = res_grade;
	}

	public int getRes_max_person() {
		return res_max_person;
	}

	public void setRes_max_person(int res_max_person) {
		this.res_max_person = res_max_person;
	}

	public String getRes_contact() {
		return res_contact;
	}

	public void setRes_contact(String res_contact) {
		this.res_contact = res_contact;
	}

	public String getRes_zipcode() {
		return res_zipcode;
	}

	public void setRes_zipcode(String res_zipcode) {
		this.res_zipcode = res_zipcode;
	}

	public String getRes_address() {
		return res_address;
	}

	public void setRes_address(String res_address) {
		this.res_address = res_address;
	}

	public String getRes_address_detail() {
		return res_address_detail;
	}

	public void setRes_address_detail(String res_address_detail) {
		this.res_address_detail = res_address_detail;
	}

	public Timestamp getRes_regdate() {
		return res_regdate;
	}

	public void setRes_regdate(Timestamp res_regdate) {
		this.res_regdate = res_regdate;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	@Override
	public String toString() {
		return "RestaurantVO [res_no=" + res_no + ", mem_no=" + mem_no + ", food_type_no=" + food_type_no
				+ ", res_type_no=" + res_type_no + ", res_name=" + res_name + ", res_introduce=" + res_introduce
				+ ", res_work_day=" + res_work_day + ", res_work_hour=" + res_work_hour + ", thumbnail=" + thumbnail
				+ ", res_grade=" + res_grade + ", res_max_person=" + res_max_person + ", res_contact=" + res_contact
				+ ", res_zipcode=" + res_zipcode + ", res_address=" + res_address + ", res_address_detail="
				+ res_address_detail + ", res_regdate=" + res_regdate + ", res_status=" + res_status + "]";
	}
	
	
}
