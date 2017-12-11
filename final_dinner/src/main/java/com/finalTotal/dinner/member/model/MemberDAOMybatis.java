package com.finalTotal.dinner.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOMybatis extends SqlSessionDaoSupport
	implements MemberDAO{
	
	private String namespace="config.mybatis.mapper.oracle.member";

	@Override
	public String selectPwd(String memId) {
		return getSqlSession().selectOne(namespace+".selectPwdByUserid", memId);
	}

	public MemberVO selectMember(String userid){
		return getSqlSession().selectOne(namespace+".selectMember", userid);		
	}
	
}
