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
	
	
}
