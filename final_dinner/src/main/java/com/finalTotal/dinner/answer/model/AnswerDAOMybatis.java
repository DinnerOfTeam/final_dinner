package com.finalTotal.dinner.answer.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAOMybatis extends SqlSessionDaoSupport implements AnswerDAO{
	private String namespace="config.mybatis.mapper.oracle.answer";

	@Override
	public int insertAnswer(AnswerVO vo) {
		return getSqlSession().insert(namespace+".insertAnswer", vo);
	}
	
}
