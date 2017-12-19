package com.finalTotal.dinner.answer.model;

import java.sql.Timestamp;

public class AnswerVO {
		private int qnaAnswerNo;
		private int qnaQuestionNo;
		private String answerContent;
		private Timestamp answerRegdate;
		
		public int getQnaAnswerNo() {
			return qnaAnswerNo;
		}
		public void setQnaAnswerNo(int qnaAnswerNo) {
			this.qnaAnswerNo = qnaAnswerNo;
		}
		public int getQnaQuestionNo() {
			return qnaQuestionNo;
		}
		public void setQnaQuestionNo(int qnaQuestionNo) {
			this.qnaQuestionNo = qnaQuestionNo;
		}
		public String getAnswerContent() {
			return answerContent;
		}
		public void setAnswerContent(String answerContent) {
			this.answerContent = answerContent;
		}
		public Timestamp getAnswerRegdate() {
			return answerRegdate;
		}
		public void setAnswerRegdate(Timestamp answerRegdate) {
			this.answerRegdate = answerRegdate;
		}
		@Override
		public String toString() {
			return "AnswerVO [qnaAnswerNo=" + qnaAnswerNo + ", qnaQuestionNo=" + qnaQuestionNo
					+ ", answerContent=" + answerContent + ", answerRegdate=" + answerRegdate + "]";
		}
}
