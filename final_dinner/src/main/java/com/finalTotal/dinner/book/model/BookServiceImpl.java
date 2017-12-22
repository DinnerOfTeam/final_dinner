package com.finalTotal.dinner.book.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {

	
	@Autowired
	private BookDAO bookDao;
	
	@Override
	public List<BookVO> selectByAdd(int memNo) {
		return bookDao.selectByAdd(memNo); 
	}

	@Override
	public int deleteBook(int bookNo) {
		return bookDao.deleteBook(bookNo);
	}
	
}
