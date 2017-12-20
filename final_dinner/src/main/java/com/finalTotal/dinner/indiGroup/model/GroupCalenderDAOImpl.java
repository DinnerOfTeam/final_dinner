package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class GroupCalenderDAOImpl extends SqlSessionDaoSupport 
		implements GroupCalenderDAO {
	private String namespace= "config.groupCalender";

	@Override
	public int insertCalender(GroupBoardVO vo) {
		return getSqlSession().insert(namespace+ ".insertCalender", vo);
	}

	@Override
	public int deleteCalender(int calNo) {
		return getSqlSession().delete(namespace+ ".deleteCalender", calNo);
	}

	@Override
	public List<GroupCalenderVO> selectCalenderByDay(GroupCalenderVO vo) {
		return getSqlSession().selectList(namespace+ ".selectCalenderByDay", vo);
	}
}
