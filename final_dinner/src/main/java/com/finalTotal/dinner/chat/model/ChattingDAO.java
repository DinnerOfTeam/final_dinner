package com.finalTotal.dinner.chat.model;

import java.util.List;
import java.util.Map;

public interface ChattingDAO {
	public List<ChattingVO> showAllChat(int groupNo);
	public List<ChattingUserVO> showAllUser(int groupNo);
	public int updateUserNone(int memNo);
	public int updateUserExist(Map<String, Integer> map);
	public int addChat(ChattingVO vo);
	public int insertChatUser(ChattingUserVO vo);
}
