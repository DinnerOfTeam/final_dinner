package com.finalTotal.dinner.vote.model;

import java.util.List;
import java.util.Map;

public interface VoteDAO {
	public int insertVote(VoteVO vo);
	public int insertItem(Vote_ItemVO vo);
	public List<VoteVO> selectVoteAll();
	public VoteVO selectByGroup(int groupNo);
	public VoteVO selectByNo(int voteNo);
	public List<Vote_ItemVO> selectByVno(int voteNo);
	public int insertLog(Vote_LogVO vo);
}
