package com.finalTotal.dinner.question.model;

import java.sql.Timestamp;

public class QuestionVO {
	private int qnaQuestionNo;
	private int memNo;
	private String questionTitle;
	private String questionContent;
	private int questionViewCount;
	private Timestamp questionRegdate;
	private String questionOpen;
	private String questionPwd;
	private int qnaTypeNo;
	private String memName;
	private int isAnswer;
	private int rsnum;
	public int getQnaQuestionNo() {
		return qnaQuestionNo;
	}
	public void setQnaQuestionNo(int qnaQuestionNo) {
		this.qnaQuestionNo = qnaQuestionNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getRsnum() {
		return rsnum;
	}
	public void setRsnum(int rsnum) {
		this.rsnum = rsnum;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getQuestionViewCount() {
		return questionViewCount;
	}
	public void setQuestionViewCount(int questionViewCount) {
		this.questionViewCount = questionViewCount;
	}
	public Timestamp getQuestionRegdate() {
		return questionRegdate;
	}
	public void setQuestionRegdate(Timestamp questionRegdate) {
		this.questionRegdate = questionRegdate;
	}
	public String getQuestionOpen() {
		return questionOpen;
	}
	public void setQuestionOpen(String questionOpen) {
		this.questionOpen = questionOpen;
	}
	public String getQuestionPwd() {
		return questionPwd;
	}
	public void setQuestionPwd(String questionPwd) {
		this.questionPwd = questionPwd;
	}
	public int getQnaTypeNo() {
		return qnaTypeNo;
	}
	public void setQnaTypeNo(int qnaTypeNo) {
		this.qnaTypeNo = qnaTypeNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
	}
	@Override
	public String toString() {
		return "QuestionVO [qnaQuestionNo=" + qnaQuestionNo + ", memNo=" + memNo + ", questionTitle=" + questionTitle
				+ ", questionContent=" + questionContent + ", questionViewCount=" + questionViewCount
				+ ", questionRegdate=" + questionRegdate + ", questionOpen=" + questionOpen + ", questionPwd="
				+ questionPwd + ", qnaTypeNo=" + qnaTypeNo + ", memName=" + memName + ", isAnswer=" + isAnswer
				+ ", rsnum=" + rsnum + "]";
	}
	
}
