package com.finalTotal.dinner.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.finalTotal.dinner.common.SearchVO;

@Repository
public class BoardDAOMybatis extends SqlSessionDaoSupport implements BoardDAO {
	private static String namespace="config.board";
	
	public int insertBoard(BoardVO vo) {
		return getSqlSession().insert(namespace+".insertBoard", vo);
	}
	
	public List<BoardVO> selectAll(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectAll", searchVO);
	}
	
	public int selectRecordCount(SearchVO searchVO) {
		return getSqlSession().selectOne(namespace+".selectRecordCount", searchVO);
	}
	
	public BoardVO selectByNo(int no) {
		return getSqlSession().selectOne(namespace+".selectByNo", no);
	}
	
	public int editBoard(BoardVO vo) {
		return getSqlSession().update(namespace+".editBoard", vo);
	}
	
	public int deleteBoard(int no) {
		return getSqlSession().delete(namespace+".deleteBoard", no);
	}
	
	public int deleteCommentByBoardNo(int no) {
		return getSqlSession().delete(namespace+".deleteCommentByBoardNo", no);
	}
	
	
}
