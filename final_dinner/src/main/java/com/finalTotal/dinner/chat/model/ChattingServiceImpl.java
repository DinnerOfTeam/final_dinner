package com.finalTotal.dinner.chat.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingServiceImpl implements ChattingService{
	@Autowired
	private ChattingDAO dao;

	@Override
	public List<ChattingVO> showAll(int groupNo) {
		return dao.showAll(groupNo);
	}
}
