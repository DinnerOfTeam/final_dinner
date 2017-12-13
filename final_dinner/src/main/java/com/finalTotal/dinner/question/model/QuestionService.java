package com.finalTotal.dinner.question.model;

import java.util.List;

public interface QuestionService {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	
}
