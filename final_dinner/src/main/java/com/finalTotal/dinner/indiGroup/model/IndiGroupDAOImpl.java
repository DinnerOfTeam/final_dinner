package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class IndiGroupDAOImpl extends SqlSessionDaoSupport 
		implements IndigroupDAO {
	private String namespace="config.group";

	@Override
	public int createGroup(IndigroupVO vo) {
		return getSqlSession().insert(namespace+ ".createGroup", vo);
	}

	@Override
	public int checkGroupName(String name) {
		return getSqlSession().selectOne(namespace+ ".checkGroupName", name);
	}

	@Override
	public List<IndigroupVO> selectByGroupName(String name) {
		return getSqlSession().selectList(namespace+ ".selectByGroupName", name);
	}

}
