package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupCalenderServiceImpl implements GroupCalenderService {
	@Autowired
	private GroupCalenderDAO dao;

	@Override
	public int insertCalender(GroupBoardVO vo) {
		return dao.insertCalender(vo);
	}

	@Override
	public int deleteCalender(int calNo) {
		return dao.deleteCalender(calNo);
	}

	@Override
	public List<GroupCalenderVO> selectCalenderByDay(GroupCalenderVO vo) {
		return dao.selectCalenderByDay(vo);
	}

}
