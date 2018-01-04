package com.finalTotal.dinner.vote.model;

import java.util.Date;

public class Vote_LogVO {
	private int voteLogNo;
	private int voteNo;
	private int memNo;
	private int voteItemNo;
	private Date voteDate;
	public int getVoteLogNo() {
		return voteLogNo;
	}
	public void setVoteLogNo(int voteLogNo) {
		this.voteLogNo = voteLogNo;
	}
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
	public int getVoteItemNo() {
		return voteItemNo;
	}
	public void setVoteItemNo(int voteItemNo) {
		this.voteItemNo = voteItemNo;
	}
	public Date getVoteDate() {
		return voteDate;
	}
	public void setVoteDate(Date voteDate) {
		this.voteDate = voteDate;
	}
	@Override
	public String toString() {
		return "Vote_LogVO [voteLogNo=" + voteLogNo + ", voteNo=" + voteNo + ", memNo=" + memNo + ", voteItemNo="
				+ voteItemNo + ", voteDate=" + voteDate + "]";
	}
	

	
}
