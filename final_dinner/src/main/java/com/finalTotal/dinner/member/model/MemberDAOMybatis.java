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

	public MemberVO selectMember(String memId){
		return getSqlSession().selectOne(namespace+".selectMember", memId);		
	}
	
	public int duplicatedmemId(String memId){
		return getSqlSession().selectOne(namespace+".selectDup", memId);
	}
	
	public int insertMember(MemberVO vo){
		return getSqlSession().insert(namespace+".insertMember", vo);
	}	
	
	public int updateMember(MemberVO vo) {
		return getSqlSession().update(namespace+".updateMember", vo);
	}
}
