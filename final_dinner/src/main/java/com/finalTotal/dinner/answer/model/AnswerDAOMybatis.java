package com.finalTotal.dinner.answer.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAOMybatis extends SqlSessionDaoSupport implements AnswerDAO{
	private String namespace="config.mybatis.mapper.oracle.answer";
	
	
	@Override
	public int insertAnswer(AnswerVO vo) {
		return getSqlSession().insert(namespace+".insertAnswer", vo);
	}
	
	@Override
	public AnswerVO selectByNo(int no) {
		return getSqlSession().selectOne(namespace+".selectByNo", no);
	}

	@Override
	public List<AnswerVO> selectByQuestionNo(int no) {
		return getSqlSession().selectList(namespace+".selectByQuestionNo", no);
	}
	
}
