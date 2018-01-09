package com.finalTotal.dinner.question.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface QuestionService {
	public int insertqna(QuestionVO vo);
	public List<QuestionVO> selectQnaAll();
	public List<QuestionVO> searchAll(SearchVO vo);
	public List<QuestionVO> mainNotice();
	public int updateReadCount(int no);
	public QuestionVO selectByNo(int no);
	public List<QuestionVO> selectByType(SearchVO vo);
	public int updateQna(QuestionVO vo);
	public int deleteQna(int no);
	public List<QuestionTypeVO> selectTypeAll();
	public int getTotal(SearchVO vo);
	public int getTotalType(SearchVO vo);
	public List<QuestionVO> adminSelectAll();
}
