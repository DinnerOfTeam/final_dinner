package com.finalTotal.dinner.vote.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDAOMybatis extends SqlSessionDaoSupport implements VoteDAO{
	private String namespace = "config.mybatis.mapper.oracle.vote";

	@Override
	public int insertVote(VoteVO vo) {
		return getSqlSession().insert(namespace+".insertVote",vo);
	}
}
