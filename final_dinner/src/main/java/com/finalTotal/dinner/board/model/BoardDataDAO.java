package com.finalTotal.dinner.board.model;

import java.util.List;

public interface BoardDataDAO {
	public int insertFile(BoardDataVO vo);
	
	public List<BoardDataVO> selectFileByBoardNo(int freeNo);
	public int selectFileCountByBoardNo(int freeNo);
	public BoardDataVO selectFileByNo(int freeDataNo);
	
	public int deleteFileByVo(BoardDataVO vo);
	public int deleteFileByBoardNo(int freeNo);
}
