package com.finalTotal.dinner.vote.model;

import java.util.Date;

public class Vote_LogVO {
	private int voteLogNo;
	private int voteNo;
	private int memberNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
		return "Vote_LogVO [voteLogNo=" + voteLogNo + ", voteNo=" + voteNo + ", memberNo=" + memberNo + ", voteItemNo="
				+ voteItemNo + ", voteDate=" + voteDate + "]";
	}

	
}
