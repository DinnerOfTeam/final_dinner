package com.finalTotal.dinner.question.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class QuestionDAOMybatis extends SqlSessionDaoSupport implements QuestionDAO{
	private String namespace="config.mybatis.mapper.oracle.question";
	
	public int insertqna(QuestionVO vo) {
		return getSqlSession().insert(namespace+".insertqna",vo);
	}
}
