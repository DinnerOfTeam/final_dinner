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
}
