package com.finalTotal.dinner.book.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOImpl extends SqlSessionDaoSupport implements BookDAO {
	@Override
	public int insert(BookVO vo) {
		return getSqlSession().insert("config.book.insertBook", vo);
	}
}
