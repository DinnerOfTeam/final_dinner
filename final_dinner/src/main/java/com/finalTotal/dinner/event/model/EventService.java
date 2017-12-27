package com.finalTotal.dinner.event.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface EventService {
	public int insertEvent(EventVO vo);
	public List<EventVO> selectEventByDate(SearchVO vo);
	public int countEventByDate(String eventDate);
}
