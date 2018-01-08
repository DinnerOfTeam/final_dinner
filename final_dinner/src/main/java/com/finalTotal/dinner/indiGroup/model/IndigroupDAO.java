package com.finalTotal.dinner.indiGroup.model;

import java.util.List;
import java.util.Map;

public interface IndigroupDAO {

	public int createGroup(IndigroupVO vo);
	public int checkGroupName(String name);
	public List<IndigroupVO> selectByGroupName(Map<String, Object> map);
	public int regiGroup(GroupRegiVO vo);
	public int cancelGroup(GroupRegiVO vo);
	public int insertGroupMember(GroupMemberVO vo);
	public int checkGroup(GroupRegiVO vo);
	public int deleteGroupMember(GroupMemberVO vo);
	public List<IndigroupVO> selectMyGroup(int memNo);
	public int countNumberGroupMember(int groupNo);
	public List<GroupMemberVO> showAllUser(int groupNo);
	public int updateUserNone(int memNo);
	public int updateUserExist(Map<String, Integer> map);
	public IndigroupVO selectByGNtoMN(int groupNo);
	public List<GroupRegiVO> selectRegiList(int groupNo);
	public IndigroupVO selectByGroupNo(int groupNo);
	public int isGroupTop(int groupNo);
	public int deleteGroup(int groupNo);
	public List<IndigroupVO> allGroup();
}
