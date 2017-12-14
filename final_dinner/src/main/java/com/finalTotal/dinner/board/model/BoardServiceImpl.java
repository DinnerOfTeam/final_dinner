package com.finalTotal.dinner.board.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger=LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int insertBoard(BoardVO vo) {
		return boardDAO.insertBoard(vo);
	}

	@Override
	public List<BoardVO> selectAll(SearchVO searchVO) {
		return boardDAO.selectAll(searchVO);
	}

	@Override
	public int selectRecordCount(SearchVO searchVO) {
		return boardDAO.selectRecordCount(searchVO);
	}

	@Override
	public BoardVO selectByNo(int no) {
		return boardDAO.selectByNo(no);
	}

	@Override
	public int editBoard(BoardVO vo) {
		return boardDAO.editBoard(vo);
	}

	@Override
	@Transactional
	public int deleteBoard(int no) {
		int cnt=boardDAO.deleteCommentByBoardNo(no);
		logger.info("게시판 글삭제 댓글 삭제결과 cnt={}", cnt);
		
		cnt=boardDAO.deleteBoard(no);
		logger.info("게시판 글삭제 결과 cnt={}", cnt);
		
		return cnt;
	}


}
