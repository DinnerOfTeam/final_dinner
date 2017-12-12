package com.finalTotal.dinner.question.model;

import java.sql.Timestamp;

public class QuestionVO {
	private int qna_question_no;
	private int mem_no;
	private int question_type;
	private String question_title;
	private String question_content;
	private int question_view_count;
	private Timestamp question_regdate;
	public int getQna_question_no() {
		return qna_question_no;
	}
	public void setQna_question_no(int qna_question_no) {
		this.qna_question_no = qna_question_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public int getQuestion_view_count() {
		return question_view_count;
	}
	public void setQuestion_view_count(int question_view_count) {
		this.question_view_count = question_view_count;
	}
	public Timestamp getQuestion_regdate() {
		return question_regdate;
	}
	public void setQuestion_regdate(Timestamp question_regdate) {
		this.question_regdate = question_regdate;
	}
	@Override
	public String toString() {
		return "QuestionVO [qna_question_no=" + qna_question_no + ", mem_no=" + mem_no + ", question_type="
				+ question_type + ", question_title=" + question_title + ", question_content=" + question_content
				+ ", question_view_count=" + question_view_count + ", question_regdate=" + question_regdate + "]";
	}
	
}
