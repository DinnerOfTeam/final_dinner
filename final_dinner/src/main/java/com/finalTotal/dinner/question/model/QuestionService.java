package com.finalTotal.dinner.question.model;

import java.util.List;

public interface QuestionService {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	public List<QuestionVO> mainNotice();
	public int updateReadCount(int no);
	public QuestionVO selectByNo(int no);
	public List<QuestionVO> selectByType(int qnaTypeNo);
	public int updateQna(QuestionVO vo);
	public int deleteQna(int no);
}
