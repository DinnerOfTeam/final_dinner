package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

public interface IndiGroupService {

	public int createGroup(IndigroupVO vo);
	public int checkGroupName(String name);
	public List<IndigroupVO> selectByGroupName(String name);
	public int regiGroup(GroupRegiVO vo);
	public int insertGroupMember(GroupMemberVO vo);
	public List<IndigroupVO> selectMyGroup(int memNo);
	public int countNumberGroupMember(int groupNo);
}
