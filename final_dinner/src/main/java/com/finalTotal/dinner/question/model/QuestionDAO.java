package com.finalTotal.dinner.question.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface QuestionDAO {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	public List<QuestionVO> searchAll(SearchVO vo);
	public List<QuestionVO> mainNotice();
	public int updateReadCount(int no);
	public QuestionVO selectByNo(int no);
	public List<QuestionVO> selectByType(int qnaTypeNo);
	public int updateQna(QuestionVO vo);
	public int deleteQna(int no);
}
