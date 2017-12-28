package com.finalTotal.dinner.vote.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VoteServiceImpl implements VoteService{
	
	@Autowired
	private VoteDAO voteDao;

	@Override
	public int insertVote(VoteVO vo) {
		return voteDao.insertVote(vo);
	}

}
