package com.finalTotal.dinner.question.model;

import java.util.List;

public interface QuestionDAO {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	public List<QuestionVO> mainNotice();
	public int updateReadCount(int no);
	public QuestionVO selectByNo(int no);
	public List<QuestionVO> selectByType(int qnaTypeNo);
}
