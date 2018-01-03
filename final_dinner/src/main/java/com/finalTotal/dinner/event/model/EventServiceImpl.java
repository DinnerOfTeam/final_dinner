package com.finalTotal.dinner.event.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalTotal.dinner.common.SearchVO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public int insertEvent(EventVO vo) {
		return eventDAO.insertEvent(vo);
	}

	@Override
	public List<EventVO> selectEventByDate(SearchVO vo) {
		return eventDAO.selectEventByDate(vo);
	}

	@Override
	public int countEventByDate(String eventDate) {
		return eventDAO.countEventByDate(eventDate);
	}

	@Override
	public List<EventVO> selectEventList(SearchVO vo) {
		return eventDAO.selectEventList(vo);
	}

	@Override
	public int countEventList(String resNo) {
		return eventDAO.countEventList(resNo);
	}

	@Override
	public EventVO selectEventByNo(int eventNo) {
		return eventDAO.selectEventByNo(eventNo);
	}

	@Override
	public int eventApprove(int eventNo) {
		return eventDAO.eventApprove(eventNo);
	}
	
	@Override
	public int eventClose(EventVO vo) {
		return eventDAO.eventClose(vo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		return eventDAO.deleteEvent(eventNo);
	}
	
}
