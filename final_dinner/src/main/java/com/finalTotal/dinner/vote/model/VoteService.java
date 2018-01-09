package com.finalTotal.dinner.vote.model;

import java.util.List;
import java.util.Map;

public interface VoteService {
	public int insertVote(VoteVO vo, List<Vote_ItemVO> list);
	public List<VoteVO> selectVoteAll();
	public List<VoteVO> selectByGroup(int groupNo);
	public VoteVO selectByNo(int voteNo);
	public List<Vote_ItemVO> selectByVno(int voteNo);
	public int insertLog(List<Vote_LogVO> list);
	public List<VoteVO> selectVote(int groupNo);
	public List<Integer> whoVoted(int voteNo);
	public List<Vote_ItemVO> resultVote(int voteNo);
}
