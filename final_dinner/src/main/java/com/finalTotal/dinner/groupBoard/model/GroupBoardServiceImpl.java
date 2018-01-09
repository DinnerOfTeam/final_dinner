package com.finalTotal.dinner.groupBoard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalTotal.dinner.common.SearchVO;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {
	@Autowired
	GroupBoardDAO dao;

	@Override
	public List<GroupBoardVO> selectList(SearchVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public int selectListTotal(SearchVO vo) {
		return dao.selectListTotal(vo);
	}

	@Override
	public List<GroupBoardVO> listNotice(int groupNo) {
		return dao.listNotice(groupNo);
	}

	@Override
	public int insertBoard(GroupBoardVO vo) {
		return dao.insertBoard(vo);
	}

	@Override
	public GroupBoardVO selectByNo(int gboardNo) {
		return dao.selectByNo(gboardNo);
	}

}
