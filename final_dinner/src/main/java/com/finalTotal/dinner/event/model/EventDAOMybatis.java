package com.finalTotal.dinner.event.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.finalTotal.dinner.common.SearchVO;

@Repository
public class EventDAOMybatis extends SqlSessionDaoSupport implements EventDAO{
	private static final String namespace="config.event";
	
	@Override
	public int insertEvent(EventVO vo) {
		return getSqlSession().insert(namespace+".insertEvent", vo);
	}

	@Override
	public List<EventVO> selectEventByDate(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectEventByDate", vo);
	}

	@Override
	public int countEventByDate(String eventDate) {
		return getSqlSession().selectOne(namespace+".countEventByDate", eventDate);
	}

	@Override
	public List<EventVO> selectEventList(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectEventList", vo);
	}

	@Override
	public int countEventList(String resNo) {
		return getSqlSession().selectOne(namespace+".countEventList", resNo);
	}

	@Override
	public EventVO selectEventByNo(int eventNo) {
		return getSqlSession().selectOne(namespace+".selectEventByNo", eventNo);
	}

	@Override
	public int eventApprove(int eventNo) {
		return getSqlSession().update(namespace+".eventApprove", eventNo);
	}
	
	@Override
	public int eventClose(EventVO vo) {
		return getSqlSession().update(namespace+".eventClose", vo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		return getSqlSession().delete(namespace+".deleteEvent", eventNo);
	}

}
