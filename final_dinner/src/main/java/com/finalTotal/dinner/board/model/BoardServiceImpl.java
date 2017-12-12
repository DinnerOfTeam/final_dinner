package com.finalTotal.dinner.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
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
	public int editBoard(int no) {
		return boardDAO.editBoard(no);
	}

	@Override
	public int deleteBoard(int no) {
		return boardDAO.deleteBoard(no);
	}

}
