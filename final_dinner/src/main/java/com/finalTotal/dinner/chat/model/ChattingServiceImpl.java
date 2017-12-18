package com.finalTotal.dinner.chat.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingServiceImpl implements ChattingService{
	@Autowired
	private ChattingDAO dao;

	@Override
	public List<ChattingVO> showAllChat(int groupNo) {
		return dao.showAllChat(groupNo);
	}

	@Override
	public List<ChattingUserVO> showAllUser(int groupNo) {
		return dao.showAllUser(groupNo);
	}
}
