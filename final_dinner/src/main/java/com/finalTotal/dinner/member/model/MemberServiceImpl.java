package com.finalTotal.dinner.member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




//DB작업 이외의 로직을 담는 클래스

@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	private MemberDAO memberDao;	
	
	public int loginCheck(String memId, String memPwd){
		int result=0;
		String dbPwd = memberDao.selectPwd(memId);
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE; //해당 아이디 없음
		}else {
			if(dbPwd.equals(memPwd)) {
				result=LOGIN_OK; //로그인성공
			}else {
				result=PWD_DISAGREE; //비밀번호 불일치
			}
		}
		return result;
	}
	
	public MemberVO selectMember(String memId){
		return memberDao.selectMember(memId);
	}
	
	public int duplicatedmemId(String memId){
		//아이디 중복확인		
		int result = memberDao.duplicatedmemId(memId);
		if(result>0) {
			return EXIST_ID;//해당 아이디 존재
		}else {
			return NONE_EXIST_ID;//해당아이디 없음
		}
	}
	
	public int insertMember(MemberVO vo){
		int cnt = memberDao.insertMember(vo);
		return cnt;
	}
		
	
	public int updateMember(MemberVO vo){
		return memberDao.updateMember(vo);
	}

	@Override
	public List<MemberVO> showAll() {
		return memberDao.showAll();
	}
	
}




















