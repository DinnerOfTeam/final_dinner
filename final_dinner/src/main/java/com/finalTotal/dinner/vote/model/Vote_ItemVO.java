package com.finalTotal.dinner.vote.model;

public class Vote_ItemVO {
/*	CREATE TABLE vote_item (
			vote_item_no NUMBER NOT NULL,  투표항목 번호 
			vote_no NUMBER NOT NULL,  ‎투표 번호 
			item_title VARCHAR2(250) NOT NULL,  투표항목‎ 
			item_desc CLOB,  설명 
			item_count NUMBER  투표수 
		);*/
	private int voteItemNo, voteNo, item_count;
	private String itemTitle, itemDesc;
	private String itemArr[];
	public int getVoteItemNo() {
		return voteItemNo;
	}
	public void setVoteItemNo(int voteItemNo) {
		this.voteItemNo = voteItemNo;
	}
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String[] getItemArr() {
		return itemArr;
	}
	public void setItemArr(String[] itemArr) {
		this.itemArr = itemArr;
	}
	
	
}
