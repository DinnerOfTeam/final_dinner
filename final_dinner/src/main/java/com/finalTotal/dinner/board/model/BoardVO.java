package com.finalTotal.dinner.board.model;

import java.sql.Timestamp;

public class BoardVO {
/*	free_no NUMBER NOT NULL,  게시판번호 
	mem_no NUMBER,  회원 번호 
	free_name VARCHAR2(30) NOT NULL,  작성자 
	free_pwd VARCHAR2(50),  비밀번호 
	free_title VARCHAR2(250) NOT NULL,  제목 
	free_contents CLOB,  내용 
	free_regdate DATE NOT NULL  작성날짜 */
	
	private int freeNo;
	private int memNo;
	private String freeName;
	private String freePwd;
	private String freeTitle;
	private String freeContents;
	private Timestamp freeRegdate;
	
	private int commentCount;
	private int fileCount;
	private int timePass;
	
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getFreeName() {
		return freeName;
	}
	public void setFreeName(String freeName) {
		this.freeName = freeName;
	}
	public String getFreePwd() {
		return freePwd;
	}
	public void setFreePwd(String freePwd) {
		this.freePwd = freePwd;
	}
	public String getFreeTitle() {
		return freeTitle;
	}
	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}
	public String getFreeContents() {
		return freeContents;
	}
	public void setFreeContents(String freeContents) {
		this.freeContents = freeContents;
	}
	public Timestamp getFreeRegdate() {
		return freeRegdate;
	}
	public void setFreeRegdate(Timestamp freeRegdate) {
		this.freeRegdate = freeRegdate;
	}
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	public int getTimePass() {
		return timePass;
	}
	public void setTimePass(int timePass) {
		this.timePass = timePass;
	}
	
	@Override
	public String toString() {
		return "BoardVO [freeNo=" + freeNo + ", memNo=" + memNo + ", freeName=" + freeName + ", freePwd=" + freePwd
				+ ", freeTitle=" + freeTitle + ", freeContents=" + freeContents + ", freeRegdate=" + freeRegdate
				+ ", commentCount=" + commentCount + ", fileCount=" + fileCount + ", timePass=" + timePass + "]";
	}
	
}
