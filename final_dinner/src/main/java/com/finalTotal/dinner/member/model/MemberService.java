package com.finalTotal.dinner.member.model;

import java.util.List;

public interface MemberService {
		//아이디 중복검사시 사용하는 상수
		public static final int EXIST_ID=1;  //해당 아이디가 이미 존재
		public static final int NONE_EXIST_ID=2; //해당 아이디가 없음
		
		//로그인 처리 관련 상수
		public static final int LOGIN_OK=1;  //로그인 성공
		public static final int ID_NONE=2;   //해당 아이디 없음
		int PWD_DISAGREE=3; //비밀번호 불일치 //앞에 public static final는 생략가능
		
	
	public int loginCheck(String memId, String memPwd);
	
	public MemberVO selectMember(String memId);
	
	public int duplicatedmemId(String memId);
	
	public int insertMember(MemberVO vo);
	public int insertMemberByAdmin(MemberVO vo);
	
	public int updateMember(MemberVO vo);
	public int updateMemberByAdmin(MemberVO vo);
	
	public List<MemberVO> showAll();
	
	
}
