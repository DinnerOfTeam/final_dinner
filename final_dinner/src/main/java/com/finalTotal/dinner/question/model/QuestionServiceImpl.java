package com.finalTotal.dinner.question.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionDAO questionDao;
	
	public int insertqna(QuestionVO vo) {
		return questionDao.insertqna(vo);
	}

	@Override
	public List<QuestionVO> selectQnaAll() {
		return questionDao.selectQnaAll();
	}

	@Override
	public List<QuestionVO> mainNotice() {
		return questionDao.mainNotice();
	}

	@Override
	public int updateReadCount(int no) {
		return questionDao.updateReadCount(no);
	}

	@Override
	public QuestionVO selectByNo(int no) {
		return questionDao.selectByNo(no);
	}

	@Override
	public List<QuestionVO> selectByType(int qnaTypeNo) {
		return questionDao.selectByType(qnaTypeNo);
	}
}
