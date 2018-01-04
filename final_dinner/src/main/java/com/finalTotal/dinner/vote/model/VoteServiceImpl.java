package com.finalTotal.dinner.vote.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VoteServiceImpl implements VoteService{
	private static final Logger logger
	=LoggerFactory.getLogger(VoteServiceImpl.class);
	
	@Autowired
	private VoteDAO voteDao;

	@Override
	@Transactional
	public int insertVote(VoteVO vo, List<Vote_ItemVO> list) {
		//투표등록하기
		
		logger.info("vote 테이블 등록전");
		
		int cnt = voteDao.insertVote(vo);
		logger.info("insert 후 VoteVO={}, cnt={}", vo, cnt);
		
		logger.info("투표 항목 등록");
		for(Vote_ItemVO itemVo : list)
		{	
			itemVo.setVoteNo(vo.getVoteNo());
			cnt = voteDao.insertItem(itemVo);
		}
		logger.info("투표등록완료");
		return cnt;
	}

	@Override
	public List<VoteVO> selectVoteAll() {
		return voteDao.selectVoteAll();
	}

	@Override
	public List<VoteVO> selectByGroup(int groupNo) {
		return voteDao.selectByGroup(groupNo);
	}
	
	
	@Override
	public VoteVO selectByNo(int voteNo) {
		return voteDao.selectByNo(voteNo);
	}

	@Override
	public List<Vote_ItemVO> selectByVno(int voteNo) {
		return voteDao.selectByVno(voteNo);
	}

	@Override
	@Transactional
	public int insertLog(List<Vote_LogVO> list) {
		int cnt = 0;
		for(Vote_LogVO vo:list)
		{
			cnt = voteDao.insertLog(vo);
		}
		
		return cnt;
	}

	@Override
	public List<VoteVO> selectVote(int groupNo) {
		return voteDao.selectVote(groupNo);
	}
	

}
