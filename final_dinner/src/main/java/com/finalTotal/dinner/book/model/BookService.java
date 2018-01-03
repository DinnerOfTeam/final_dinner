package com.finalTotal.dinner.book.model;

import java.util.List;
import java.util.Map;



public interface BookService {
	
	public List<BookVO> selectByAdd(int memNo);
	public int deleteBook(int bookNo);
	public List<BookVO> selectAll(int memNo);
	public List<Map<String,Object>> selectReservedMember(int memNo);
	public List<Map<String,Object>> adminSelectDay(Map<String, Object> map);
}
