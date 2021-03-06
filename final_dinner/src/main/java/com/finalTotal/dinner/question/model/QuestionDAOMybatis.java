package com.finalTotal.dinner.question.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.finalTotal.dinner.common.SearchVO;

@Repository
public class QuestionDAOMybatis extends SqlSessionDaoSupport implements QuestionDAO{
	private String namespace="config.mybatis.mapper.oracle.question";
	
	public int insertqna(QuestionVO vo) {
		return getSqlSession().insert(namespace+".insertqna",vo);
	}

	@Override
	public List<QuestionVO> selectQnaAll() {
		return getSqlSession().selectList(namespace+".selectQnaAll");
	}

	@Override
	public List<QuestionVO> mainNotice() {
		return getSqlSession().selectList(namespace+".selectMainNotice");
	}

	@Override
	public int updateReadCount(int no) {
		return getSqlSession().update(namespace+".updateReadCount",no);
	}

	@Override
	public QuestionVO selectByNo(int no) {
		return getSqlSession().selectOne(namespace+".selectByNo",no);
	}

	@Override
	public List<QuestionVO> selectByType(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectByType", vo);
	}

	@Override
	public int updateQna(QuestionVO vo) {
		return getSqlSession().update(namespace+".updateQna",vo);
	}

	@Override
	public int deleteQna(int no) {
		return getSqlSession().delete(namespace+".deleteQna",no);
	}

	@Override
	public List<QuestionTypeVO> selectTypeAll() {
		return getSqlSession().selectList(namespace+".selectTypeAll");
	}

	public List<QuestionVO> searchAll(SearchVO vo) {
		return getSqlSession().selectList(namespace+ ".searchAll", vo);
	}

	@Override
	public int getTotal(SearchVO vo) {
		return getSqlSession().selectOne(namespace+ ".getTotal", vo);
	}

	@Override
	public List<QuestionVO> adminSelectAll() {
		return getSqlSession().selectList(namespace+ ".adminSelectAll");
	}

	@Override
	public int getTotalType(SearchVO vo) {
		return getSqlSession().selectOne(namespace+ ".getTotalType", vo);
	}
	
	
}
