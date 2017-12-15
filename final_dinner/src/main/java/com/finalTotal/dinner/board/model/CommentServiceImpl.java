package com.finalTotal.dinner.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public int insertComment(CommentVO vo) {
		return commentDAO.insertComment(vo);
	}

	@Override
	public int replyComment(CommentVO vo) {
		return commentDAO.replyComment(vo);
	}

	@Override
	public List<CommentVO> selectCommentByFreeNo(int freeNo) {
		return commentDAO.selectCommentByFreeNo(freeNo);
	}
	
	@Override
	public CommentVO selectCommentByCommentNo(int commentNo) {
		return commentDAO.selectCommentByCommentNo(commentNo);
	}

	@Override
	public int editComment(CommentVO vo) {
		return commentDAO.editComment(vo);
	}

	@Override
	public int deleteComment(int no) {
		return commentDAO.deleteComment(no);
	}
	
	
}
