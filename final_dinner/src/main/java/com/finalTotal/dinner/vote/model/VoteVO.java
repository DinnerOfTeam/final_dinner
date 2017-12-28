package com.finalTotal.dinner.vote.model;

import java.sql.Timestamp;
import java.util.Date;

public class VoteVO {
/*	CREATE TABLE vote (
			vote_no NUMBER NOT NULL,  투표 번호 
			mem_no NUMBER NOT NULL,  회원 번호 
			group_no NUMBER NOT NULL,  그룹 번호 
			vote_title VARCHAR2(300) NOT NULL,  제목 
			vote_desc CLOB,  설명 
			vote_regdate DATE DEFAULT sysdate NOT NULL,  등록일 
			vote_end_date DATE NOT NULL,  마감일 
			vote_is_end VARCHAR2(1) NOT NULL,  마감여부 
			vote_multi_sel VARCHAR2(1) DEFAULT 'N' NOT NULL  다중선택 가능 여부 
		);*/
	private int voteNo, memNo, groupNo;
	private String voteTitle, voteDesc, voteIsEnd, voteMultiSel;
	private Date voteRegdate, voteEndDate;
	private String endDate;
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getVoteTitle() {
		return voteTitle;
	}
	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}
	public String getVoteDesc() {
		return voteDesc;
	}
	public void setVoteDesc(String voteDesc) {
		this.voteDesc = voteDesc;
	}
	public String getVoteIsEnd() {
		return voteIsEnd;
	}
	public void setVoteIsEnd(String voteIsEnd) {
		this.voteIsEnd = voteIsEnd;
	}
	public String getVoteMultiSel() {
		return voteMultiSel;
	}
	public void setVoteMultiSel(String voteMultiSel) {
		this.voteMultiSel = voteMultiSel;
	}
	
	public Date getVoteRegdate() {
		return voteRegdate;
	}
	public void setVoteRegdate(Date voteRegdate) {
		this.voteRegdate = voteRegdate;
	}
	public Date getVoteEndDate() {
		return voteEndDate;
	}
	public void setVoteEndDate(Date voteEndDate) {
		this.voteEndDate = voteEndDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "VoteVO [voteNo=" + voteNo + ", memNo=" + memNo + ", groupNo=" + groupNo + ", voteTitle=" + voteTitle
				+ ", voteDesc=" + voteDesc + ", voteIsEnd=" + voteIsEnd + ", voteMultiSel=" + voteMultiSel
				+ ", voteRegdate=" + voteRegdate + ", voteEndDate=" + voteEndDate + ", endDate=" + endDate + "]";
	}
	
}
