package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

public interface IndigroupDAO {

	public int createGroup(IndigroupVO vo);
	public int checkGroupName(String name);
	public List<IndigroupVO> selectByGroupName(String name);
	public int regiGroup(GroupRegiVO vo);
	public int insertGroupMember(GroupMemberVO vo);
}
