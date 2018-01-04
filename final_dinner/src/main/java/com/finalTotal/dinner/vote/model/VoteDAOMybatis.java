package com.finalTotal.dinner.vote.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDAOMybatis extends SqlSessionDaoSupport implements VoteDAO{
	private String namespace = "config.mybatis.mapper.oracle.vote";

	@Override
	public int insertVote(VoteVO vo) {
		return getSqlSession().insert(namespace+".insertVote",vo);
	}

	@Override
	public int insertItem(Vote_ItemVO vo) {
		// TODO Auto-generated method stub
		return getSqlSession().insert(namespace+".insertItem", vo);
	}

	@Override
	public List<VoteVO> selectVoteAll() {
		return getSqlSession().selectList(namespace+".selectVoteAll");
	}

	@Override
	public List<VoteVO> selectByGroup(int groupNo) {
		return getSqlSession().selectList(namespace+".selectByGroup",groupNo);
	}

	
	@Override
	public VoteVO selectByNo(int voteNo) {
		return getSqlSession().selectOne(namespace+".selectByNo", voteNo);
	}

	@Override
	public List<Vote_ItemVO> selectByVno(int voteNo) {
		return getSqlSession().selectList(namespace+".selectByVno", voteNo);
	}

	@Override
	public int insertLog(Vote_LogVO vo) {
		return getSqlSession().insert(namespace+".insertLog",vo);
	}

	@Override
	public List<VoteVO> selectVote(int groupNo) {
		return getSqlSession().selectList(namespace+".selectVote", groupNo);
	}

}
