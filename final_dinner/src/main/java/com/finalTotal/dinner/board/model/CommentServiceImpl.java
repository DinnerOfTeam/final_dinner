package com.finalTotal.dinner.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public int insertComment(BoardVO vo) {
		return commentDAO.insertComment(vo);
	}

	@Override
	public int replyComment(BoardVO vo) {
		return commentDAO.replyComment(vo);
	}

	@Override
	public List<BoardVO> selectCommentByFreeNo(int freeNo) {
		return commentDAO.selectCommentByFreeNo(freeNo);
	}

	@Override
	public int editComment(int no) {
		return commentDAO.editComment(no);
	}

	@Override
	public int deleteComment(int no) {
		return commentDAO.deleteComment(no);
	}
	
	
}
