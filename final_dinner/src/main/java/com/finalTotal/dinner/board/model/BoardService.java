package com.finalTotal.dinner.board.model;

import java.util.List;

public interface BoardService {
	
	public int insertBoard(BoardVO vo);
	public List<BoardVO> selectAll(SearchVO searchVO);
	public int selectRecordCount(SearchVO searchVO);
	public BoardVO selectByNo(int no);
	public int editBoard(int no);
	public int deleteBoard(int no);
}
