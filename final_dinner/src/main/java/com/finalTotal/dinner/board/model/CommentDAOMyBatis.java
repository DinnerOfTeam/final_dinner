package com.finalTotal.dinner.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOMyBatis extends SqlSessionDaoSupport implements CommentDAO {
	private static String namespace="config.comment";

	public int insertComment(BoardVO vo) {
		return getSqlSession().insert(namespace+".insertComment", vo);
	}
	
	public int replyComment(BoardVO vo) {
		return getSqlSession().insert(namespace+".replyComment", vo);
	}
	
	public List<BoardVO> selectCommentByFreeNo(int freeNo) {
		return getSqlSession().selectList(namespace+".selectCommentByFreeNo", freeNo);
	}
	
	public int editComment(int no) {
		return getSqlSession().update(namespace+".editComment", no);
	}
	
	public int deleteComment(int no) {
		return getSqlSession().delete(namespace+".deleteComment", no);
	}
}
