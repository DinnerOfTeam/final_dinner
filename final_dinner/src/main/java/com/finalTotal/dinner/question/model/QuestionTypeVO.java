package com.finalTotal.dinner.question.model;

public class QuestionTypeVO {
	int qnaTypeNo;
	String qnaTypeName;
	
	public int getQnaTypeNo() {
		return qnaTypeNo;
	}
	public void setQnaTypeNo(int qnaTypeNo) {
		this.qnaTypeNo = qnaTypeNo;
	}
	public String getQnaTypeName() {
		return qnaTypeName;
	}
	public void setQnaTypeName(String qnaTypeName) {
		this.qnaTypeName = qnaTypeName;
	}
	@Override
	public String toString() {
		return "QuestionTypeVO [qnaTypeNo=" + qnaTypeNo + ", qnaTypeName=" + qnaTypeName + "]";
	}

}
