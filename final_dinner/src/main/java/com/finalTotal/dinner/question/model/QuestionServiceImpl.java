package com.finalTotal.dinner.question.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalTotal.dinner.common.SearchVO;

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
	public List<QuestionVO> selectByType(SearchVO vo) {
		return questionDao.selectByType(vo);
	}

	@Override
	public int updateQna(QuestionVO vo) {
		return questionDao.updateQna(vo);
	}

	@Override
	public int deleteQna(int no) {
		return questionDao.deleteQna(no);
	}

	@Override

	public List<QuestionTypeVO> selectTypeAll() {
		return questionDao.selectTypeAll();
	}
	

	public List<QuestionVO> searchAll(SearchVO vo) {
		return questionDao.searchAll(vo);
	}

	@Override
	public int getTotal(SearchVO vo) {
		return questionDao.getTotal(vo);
	}

	@Override
	public List<QuestionVO> adminSelectAll() {
		return questionDao.adminSelectAll();
	}

	@Override
	public int getTotalType(SearchVO vo) {
		return questionDao.getTotalType(vo);
	}
	
}
