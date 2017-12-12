package com.finalTotal.dinner.board.model;

import java.util.List;

public interface CommentDAO {
	
	public int insertComment(BoardVO vo);
	public int replyComment(BoardVO vo);
	public List<BoardVO> selectCommentByFreeNo(int freeNo);
	public int editComment(int no);
	public int deleteComment(int no);
	
}
