package com.finalTotal.dinner.chat.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDAOImpl extends SqlSessionDaoSupport 
		implements ChattingDAO{
	private String namespace= "config.chatting";

	@Override
	public List<ChattingVO> showAllChat(int groupNo) {
		return getSqlSession().selectList(namespace+ ".showAllChat", groupNo);
	}

	@Override
	public List<ChattingUserVO> showAllUser(int groupNo) {
		return getSqlSession().selectList(namespace+ ".showAllUser", groupNo);
	}

}
