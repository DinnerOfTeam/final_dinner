package com.finalTotal.dinner.answer.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerDAO answerDao;
	
	@Override
	public int insertAnswer(AnswerVO vo) {
		return answerDao.insertAnswer(vo);
	}

	@Override
	public AnswerVO selectByNo(int no) {
		// TODO Auto-generated method stub
		return answerDao.selectByNo(no);
	}

	@Override
	public List<AnswerVO> selectByQuestionNo(int no) {
		return answerDao.selectByQuestionNo(no);
	}
}
