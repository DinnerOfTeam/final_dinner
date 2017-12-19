package com.finalTotal.dinner.board.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardDataServiceImpl implements BoardDataService{
	
	@Autowired
	BoardDataDAO boardDataDAO;
	
	@Override
	@Transactional
	public int insertFile(List<BoardDataVO> dataList, int boardNo) {
		int cnt=0;
		
		if(dataList!=null && !dataList.isEmpty() && boardNo>0) {
			try {
				for(BoardDataVO dataVO : dataList) {
					String oFileName=dataVO.getFreeDataOriginalName();
					if(oFileName!=null && !oFileName.isEmpty()) {
						dataVO.setFreeNo(boardNo);
						cnt=boardDataDAO.insertFile(dataVO);
					}
				}
			}catch(RuntimeException e) {
				cnt=0;
				e.printStackTrace();
			}
		}
		
		return cnt;
	}

	@Override
	public Map<String, Object> selectFileInfoByBoardNo(int boardNo) {
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		
		List<BoardDataVO> list=null;
		int cnt=0;
		
		list=boardDataDAO.selectFileByBoardNo(boardNo);
		cnt=boardDataDAO.selectFileCountByBoardNo(boardNo);
		
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		
		return resultMap;
	}
	
	@Override
	public BoardDataVO selectFileByNo(int freeDataNo) {
		return boardDataDAO.selectFileByNo(freeDataNo);
	}

	@Override
	public int deleteFileByBoardNo(int boardNo) {
		return boardDataDAO.deleteFileByBoardNo(boardNo);
	}

	@Override
	@Transactional
	public List<BoardDataVO> deleteFiles(List<BoardDataVO> dataList, int boardNo) {
		int cnt=0;
		
		List<BoardDataVO> list=new ArrayList<BoardDataVO>();
		
		if(dataList!=null && !dataList.isEmpty() && boardNo>0) {
			try {
				for(BoardDataVO dataVO : dataList) {
					dataVO.setFreeNo(boardNo);
					cnt=boardDataDAO.deleteFileByVo(dataVO);
					
					if(cnt>0) {
						list.add(dataVO);
					}
				}
			}catch(RuntimeException e) {
				cnt=0;
				list=null;
				e.printStackTrace();
			}
		}
		
		return list;
	}
	

}
