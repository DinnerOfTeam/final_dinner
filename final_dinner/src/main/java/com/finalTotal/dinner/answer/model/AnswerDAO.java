package com.finalTotal.dinner.answer.model;

public interface AnswerDAO {
	public int insertAnswer(AnswerVO vo);
	public AnswerVO selectByNo(int no);
}
