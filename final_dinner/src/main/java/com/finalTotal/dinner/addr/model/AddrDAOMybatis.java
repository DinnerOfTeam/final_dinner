package com.finalTotal.dinner.addr.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AddrDAOMybatis extends SqlSessionDaoSupport implements AddrDAO{
	private static final String namespace="config.addr";
	
	@Override
	public List<SidoVO> selectSido() {
		return getSqlSession().selectList(namespace+".selectSido");
	}

	@Override
	public List<SigunguVO> selectSigungu(int sigunguNo) {
		return getSqlSession().selectList(namespace+".selectSigungu", sigunguNo);
	}

	@Override
	public List<AddrVO> selectAddr() {
		return getSqlSession().selectList(namespace+".selectAddr");
	}

	

}
