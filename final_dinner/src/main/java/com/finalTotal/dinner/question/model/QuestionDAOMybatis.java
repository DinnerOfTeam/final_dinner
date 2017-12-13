package com.finalTotal.dinner.question.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

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
	
	
}
