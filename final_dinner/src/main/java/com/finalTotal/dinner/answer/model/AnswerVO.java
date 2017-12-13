package com.finalTotal.dinner.answer.model;

import java.sql.Timestamp;

public class AnswerVO {
		private int qna_answer_no;
		private int qna_question_no;
		private int mem_no;
		private String answer_content;
		private Timestamp answer_regdate;
		public int getQna_answer_no() {
			return qna_answer_no;
		}
		public void setQna_answer_no(int qna_answer_no) {
			this.qna_answer_no = qna_answer_no;
		}
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
		public String getAnswer_content() {
			return answer_content;
		}
		public void setAnswer_content(String answer_content) {
			this.answer_content = answer_content;
		}
		public Timestamp getAnswer_regdate() {
			return answer_regdate;
		}
		public void setAnswer_regdate(Timestamp answer_regdate) {
			this.answer_regdate = answer_regdate;
		}
		@Override
		public String toString() {
			return "AnswerVO [qna_answer_no=" + qna_answer_no + ", qna_question_no=" + qna_question_no + ", mem_no="
					+ mem_no + ", answer_content=" + answer_content + ", answer_regdate=" + answer_regdate + "]";
		}
		
}
