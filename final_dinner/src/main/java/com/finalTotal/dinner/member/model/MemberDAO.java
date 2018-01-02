package com.finalTotal.dinner.member.model;

import java.util.List;

public interface MemberDAO {
	
	
	
	public String selectPwd(String memId);
	
	public MemberVO selectMember(String memId);
	
	public int duplicatedmemId(String memId);
	
	public int insertMember(MemberVO vo);
	public int insertMemberByAdmin(MemberVO vo);
	
	public int updateMember(MemberVO vo);
	public int updateMemberByAdmin(MemberVO vo);
	
	public List<MemberVO> showAll();
	public List<MemberVO> showAll2(int currentPage);
	
	public int memberOut(String memId);
}
