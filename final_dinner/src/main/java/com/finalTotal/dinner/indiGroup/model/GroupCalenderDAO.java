package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

public interface GroupCalenderDAO {
	public int insertCalender(GroupCalenderVO vo);
	public int deleteCalender(int calNo);
	public List<GroupCalenderVO> selectCalenderByDay(GroupCalenderVO vo);
}
