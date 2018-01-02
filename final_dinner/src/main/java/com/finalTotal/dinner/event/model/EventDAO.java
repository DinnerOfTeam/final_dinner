package com.finalTotal.dinner.event.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface EventDAO {
	public int insertEvent(EventVO vo);
	public List<EventVO> selectEventByDate(SearchVO vo);
	public int countEventByDate(String eventDate);
	public List<EventVO> selectEventList(SearchVO vo);
	public int countEventList(String resNo);
	public EventVO selectEventByNo(int eventNo);
	public int eventApprove(int eventNo);
	public int eventClose(EventVO vo);
	public int deleteEvent(int eventNo);
}
