package com.finalTotal.dinner.chat.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updateUserNone(int memNo) {
		return getSqlSession().update(namespace+ ".updateUserNone", memNo);
	}

	@Override
	public int updateUserExist(Map<String, Integer> map) {
		return getSqlSession().update(namespace+ ".updateUserExist", map);
	}

	@Override
	public int addChat(ChattingVO vo) {
		return getSqlSession().insert(namespace+ ".addChat", vo);
	}

	@Override
	public int insertChatUser(ChattingUserVO vo) {
		return getSqlSession().insert(namespace+ ".insertChatUser", vo);
	}
}
