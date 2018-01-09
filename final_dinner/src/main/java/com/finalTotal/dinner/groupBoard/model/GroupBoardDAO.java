package com.finalTotal.dinner.groupBoard.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface GroupBoardDAO {
	public List<GroupBoardVO> selectList(SearchVO vo);
	public int selectListTotal(SearchVO vo);
	public List<GroupBoardVO> listNotice(int groupNo);
	public int insertBoard(GroupBoardVO vo);
	public GroupBoardVO selectByNo(int gboardNo);
}
