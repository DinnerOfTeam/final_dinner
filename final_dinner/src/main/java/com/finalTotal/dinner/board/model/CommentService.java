package com.finalTotal.dinner.board.model;

import java.util.List;

public interface CommentService {
	
	public int insertComment(CommentVO vo);
	public int replyComment(CommentVO vo);
	public List<CommentVO> selectCommentByFreeNo(int freeNo);
	public int editComment(int no);
	public int deleteComment(int no);
	
}
