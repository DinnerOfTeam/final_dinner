package com.finalTotal.dinner.book.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOMybatis extends SqlSessionDaoSupport implements BookDAO {

	private final static String namespace = "config.mybatis.mapper.oracle.book";
	
	@Override
	public List<BookVO> selectByAdd(int memNo) {
		return getSqlSession().selectList(namespace+".selectByAdd",memNo);
	}

	@Override
	public int deleteBook(int bookNo) {
		return getSqlSession().delete(namespace+".deleteBook",bookNo);
	}

	@Override
	public List<BookVO> selectAll(int memNo) {
		return getSqlSession().selectList(namespace+".selectAll",memNo);
	}

	@Override
	public List<Map<String,Object>> selectReservedMember(int memNo) {
		return getSqlSession().selectList(namespace+".selectReservedMember",memNo);
	}
	
}
