package com.finalTotal.dinner.board.model;

import java.sql.Timestamp;

public class CommentVO {
	/*comment_no NUMBER NOT NULL,  댓글번호 
	mem_no NUMBER,  회원 번호 
	free_no NUMBER,  게시판번호 
	comment_name VARCHAR2(30) NOT NULL,  작성자 
	comment_pwd VARCHAR2(50),  비밀번호 
	comment_contents CLOB,  내용 
	comment_regdate DATE NOT NULL,  작성날짜 
	comment_groupno NUMBER,  그룹번호 
	comment_del_flag VARCHAR2(1) DEFAULT 'N' NOT NULL	 삭제여부 */
	
	private int commentNo;
	private int memNo;
	private int freeNo;
	private String commentName;
	private String commentPwd;
	private String commentContents;
	private Timestamp commentRegdate;
	private int commentGroupno;
	private int commentStep;
	private String commentDelFlag;
	
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getCommentName() {
		return commentName;
	}
	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}

	public String getCommentPwd() {
		return commentPwd;
	}

	public void setCommentPwd(String commentPwd) {
		this.commentPwd = commentPwd;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public Timestamp getCommentRegdate() {
		return commentRegdate;
	}

	public void setCommentRegdate(Timestamp commentRegdate) {
		this.commentRegdate = commentRegdate;
	}

	public int getCommentGroupno() {
		return commentGroupno;
	}

	public void setCommentGroupno(int commentGroupno) {
		this.commentGroupno = commentGroupno;
	}

	public int getCommentStep() {
		return commentStep;
	}

	public void setCommentStep(int commentStep) {
		this.commentStep = commentStep;
	}

	public String getCommentDelFlag() {
		return commentDelFlag;
	}

	public void setCommentDelFlag(String commentDelFlag) {
		this.commentDelFlag = commentDelFlag;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", memNo=" + memNo + ", freeNo=" + freeNo + ", commentName="
				+ commentName + ", commentPwd=" + commentPwd + ", commentContents=" + commentContents
				+ ", commentRegdate=" + commentRegdate + ", commentGroupno=" + commentGroupno + ", commentStep="
				+ commentStep + ", commentDelFlag=" + commentDelFlag + "]";
	}
	
}
