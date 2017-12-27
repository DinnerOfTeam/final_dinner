package com.finalTotal.dinner.board.model;

import java.util.List;

import com.finalTotal.dinner.common.SearchVO;

public interface BoardDAO {
	public int insertBoard(BoardVO vo);
	public List<BoardVO> selectAll(SearchVO searchVO);
	public int selectRecordCount(SearchVO searchVO);
	public BoardVO selectByNo(int no);
	public int editBoard(BoardVO vo);
	public int deleteBoard(int no);
	public int deleteCommentByBoardNo(int no);
	
}
