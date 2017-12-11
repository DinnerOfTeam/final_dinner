package com.finalTotal.dinner.member.model;

import java.sql.SQLException;

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
	
	public MemberVO selectMember(String userid){
		return memberDao.selectMember(userid);
	}
	
	
		
}




















