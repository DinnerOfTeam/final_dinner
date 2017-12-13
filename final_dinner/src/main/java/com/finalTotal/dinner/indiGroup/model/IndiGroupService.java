package com.finalTotal.dinner.indiGroup.model;

import java.util.List;

public interface IndiGroupService {

	public int createGroup(IndigroupVO vo);
	public int checkGroupName(String name);
	public List<IndigroupVO> selectByGroupName(String name);
}
