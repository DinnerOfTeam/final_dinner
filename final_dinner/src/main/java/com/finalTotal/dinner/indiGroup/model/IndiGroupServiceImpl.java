package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndiGroupServiceImpl implements IndiGroupService{
	@Autowired
	private IndigroupDAO dao;

	@Override
	public int createGroup(IndigroupVO vo) {
		return dao.createGroup(vo);
	}

	@Override
	public int checkGroupName(String name) {
		return dao.checkGroupName(name);
	}

	@Override
	public List<IndigroupVO> selectByGroupName(String name) {
		return dao.selectByGroupName(name);
	}

	@Override
	public int regiGroup(GroupRegiVO vo) {
		return dao.regiGroup(vo);
	}

	@Override
	public int insertGroupMember(GroupMemberVO vo) {
		return dao.insertGroupMember(vo);
	}
	
	
}
