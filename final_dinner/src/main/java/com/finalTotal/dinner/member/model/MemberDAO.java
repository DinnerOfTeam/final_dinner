package com.finalTotal.dinner.member.model;


public interface MemberDAO {
	
	
	
	public String selectPwd(String memId);
	
	public MemberVO selectMember(String userid);
	
	
}
