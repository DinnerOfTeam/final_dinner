package com.finalTotal.dinner.book.model;

import java.util.List;



public interface BookService {
	
	public List<BookVO> selectByAdd(int memNo);
	public int deleteBook(int bookNo);
}
