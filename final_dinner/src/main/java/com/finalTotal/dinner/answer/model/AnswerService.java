package com.finalTotal.dinner.answer.model;

import java.util.List;

public interface AnswerService {
	public int insertAnswer(AnswerVO vo);
	public AnswerVO selectByNo(int no);
	public List<AnswerVO> selectByQuestionNo(int no);
}
