package com.finalTotal.dinner.chat.model;

import java.util.List;

public interface ChattingService {
	public List<ChattingVO> showAllChat(int groupNo);
	public List<ChattingUserVO> showAllUser(int groupNo);
}
