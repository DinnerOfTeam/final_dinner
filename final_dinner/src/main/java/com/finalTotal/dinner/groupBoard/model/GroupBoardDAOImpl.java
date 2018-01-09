package com.finalTotal.dinner.groupBoard.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.finalTotal.dinner.common.SearchVO;

@Repository
public class GroupBoardDAOImpl extends SqlSessionDaoSupport
		implements GroupBoardDAO {
	private String name= "config.groupBoard";

	@Override
	public List<GroupBoardVO> selectList(SearchVO vo) {
		return getSqlSession().selectList(name+ ".selectList", vo);
	}

	@Override
	public int selectListTotal(SearchVO vo) {
		return getSqlSession().selectOne(name+ ".selectListTotal", vo);
	}

	@Override
	public List<GroupBoardVO> listNotice(int groupNo) {
		return getSqlSession().selectList(name+ ".listNotice", groupNo);
	}

	@Override
	public int insertBoard(GroupBoardVO vo) {
		return getSqlSession().insert(name+ ".insertBoard", vo);
	}

	@Override
	public GroupBoardVO selectByNo(int gboardNo) {
		return getSqlSession().selectOne(name+ ".selectByNo", gboardNo);
	}

}
