package com.finalTotal.dinner.question.model;

import java.util.List;

public interface QuestionDAO {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	
}
