package com.finalTotal.dinner.member.model;

public class MemberVO {
	
	private int memNo;
    private String memId;
    private String memPwd;
    private String memName;
    private String memZipcode;
    private String memAdd;
    private String memAddDetail;
    private String memTel1;    
    private String memTel2;
    private String memTel3;
    private String memEmail1;
    private String memEmail2;
    private String memEmail3;
    private int memGrade;
	
    public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int memNo, String memId, String memPwd, String memName, String memZipcode, String memAdd,
			String memAddDetail, String memTel1, String memTel2, String memTel3, String memEmail1, String memEmail2,
			String memEmail3, int memGrade) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memZipcode = memZipcode;
		this.memAdd = memAdd;
		this.memAddDetail = memAddDetail;
		this.memTel1 = memTel1;
		this.memTel2 = memTel2;
		this.memTel3 = memTel3;
		this.memEmail1 = memEmail1;
		this.memEmail2 = memEmail2;
		this.memEmail3 = memEmail3;
		this.memGrade = memGrade;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemZipcode() {
		return memZipcode;
	}

	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}

	public String getMemAdd() {
		return memAdd;
	}

	public void setMemAdd(String memAdd) {
		this.memAdd = memAdd;
	}

	public String getMemAddDetail() {
		return memAddDetail;
	}

	public void setMemAddDetail(String memAddDetail) {
		this.memAddDetail = memAddDetail;
	}

	public String getMemTel1() {
		return memTel1;
	}

	public void setMemTel1(String memTel1) {
		this.memTel1 = memTel1;
	}

	public String getMemTel2() {
		return memTel2;
	}

	public void setMemTel2(String memTel2) {
		this.memTel2 = memTel2;
	}

	public String getMemTel3() {
		return memTel3;
	}

	public void setMemTel3(String memTel3) {
		this.memTel3 = memTel3;
	}

	public String getMemEmail1() {
		return memEmail1;
	}

	public void setMemEmail1(String memEmail1) {
		this.memEmail1 = memEmail1;
	}

	public String getMemEmail2() {
		return memEmail2;
	}

	public void setMemEmail2(String memEmail2) {
		this.memEmail2 = memEmail2;
	}

	public String getMemEmail3() {
		return memEmail3;
	}

	public void setMemEmail3(String memEmail3) {
		this.memEmail3 = memEmail3;
	}

	public int getMemGrade() {
		return memGrade;
	}

	public void setMemGrade(int memGrade) {
		this.memGrade = memGrade;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memZipcode=" + memZipcode + ", memAdd=" + memAdd + ", memAddDetail=" + memAddDetail + ", memTel1="
				+ memTel1 + ", memTel2=" + memTel2 + ", memTel3=" + memTel3 + ", memEmail1=" + memEmail1
				+ ", memEmail2=" + memEmail2 + ", memEmail3=" + memEmail3 + ", memGrade=" + memGrade + "]";
	}
    
    
    
}
