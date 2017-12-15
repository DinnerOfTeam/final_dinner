package com.finalTotal.dinner.board.model;

import java.util.List;

public interface CommentDAO {
	
	public int insertComment(CommentVO vo);
	public int replyComment(CommentVO vo);
	public List<CommentVO> selectCommentByFreeNo(int freeNo);
	public CommentVO selectCommentByCommentNo(int commentNo);
	public int editComment(CommentVO vo);
	public int deleteComment(int no);
	
}
