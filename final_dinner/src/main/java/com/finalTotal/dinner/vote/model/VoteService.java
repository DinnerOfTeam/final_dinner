package com.finalTotal.dinner.vote.model;

import java.util.List;

public interface VoteService {
	public int insertVote(VoteVO vo, List<Vote_ItemVO> list);
}
