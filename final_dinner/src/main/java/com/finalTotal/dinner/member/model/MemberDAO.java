package com.finalTotal.dinner.member.model;


public interface MemberDAO {
	
	
	
	public String selectPwd(String memId);
	
	public MemberVO selectMember(String memId);
	
	public int duplicatedmemId(String memId);
	
	public int insertMember(MemberVO vo);
	
	public int updateMember(MemberVO vo);
}
