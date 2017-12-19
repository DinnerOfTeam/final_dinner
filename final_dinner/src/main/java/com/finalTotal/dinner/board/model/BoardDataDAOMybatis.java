package com.finalTotal.dinner.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDataDAOMybatis extends SqlSessionDaoSupport implements BoardDataDAO{
	private static String namespace="config.board.data";

	@Override
	public int insertFile(BoardDataVO vo) {
		return getSqlSession().insert(namespace+".insertFile", vo);
	}

	@Override
	public List<BoardDataVO> selectFileByBoardNo(int freeNo) {
		return getSqlSession().selectList(namespace+".selectFileByBoardNo", freeNo);
	}
	
	@Override
	public BoardDataVO selectFileByNo(int freeDataNo) {
		return getSqlSession().selectOne(namespace+".selectFileByNo", freeDataNo);
	}
	
	@Override
	public int selectFileCountByBoardNo(int freeNo) {
		return getSqlSession().selectOne(namespace+".selectFileCountByBoardNo", freeNo);
	}
	
	@Override
	public int deleteFileByBoardNo(int freeNo) {
		return getSqlSession().delete(namespace+".deleteFileByBoardNo", freeNo);
	}

	@Override
	public int deleteFileByVo(BoardDataVO vo) {
		return getSqlSession().delete(namespace+".deleteFileByVo", vo);
	}
	
}
