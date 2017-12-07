package com.finalTotal.dinner.book.model;

import java.sql.Timestamp;

public class BookVO {
/*	create table book(
		    no number primary key,
		    title varchar2(100),
		    publisher	varchar2(50),
		    price number,
		    joindate date default  sysdate
		);*/
	private int number, price;
	private String title, publisher;
	private Timestamp joindate;
	
	public BookVO() {
	}

	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "BookVO [number=" + number 
				+ ", price=" + price + ", title=" + title 
				+ ", publisher=" + publisher
				+ ", joindate=" + joindate + "]";
	}
}
