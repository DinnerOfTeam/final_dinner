package com.finalTotal.dinner.book.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDAO dao;

	@Override
	public int insert(BookVO vo) {
		return dao.insert(vo);
	}
}
