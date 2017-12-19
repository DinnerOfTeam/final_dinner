package com.finalTotal.dinner.board.model;

import java.util.List;
import java.util.Map;

public interface BoardDataService {
	
	public int insertFile(List<BoardDataVO> dataList, int boardNo);
	
	public Map<String, Object> selectFileInfoByBoardNo(int boardNo);
	public BoardDataVO selectFileByNo(int dataNo);
	
	public int deleteFileByBoardNo(int boardNo);
	public List<BoardDataVO> deleteFiles(List<BoardDataVO> dataList, int boardNo);
	
}
