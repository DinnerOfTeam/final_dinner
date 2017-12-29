package com.finalTotal.dinner.common;

public class SearchVO {
	protected String keyword="";		//검색어
	protected String type;		//검색종류(name, title, content)
	protected int currentPage=1;	//현재페이지
	protected int firstRowNum;	//현재 페이지의 첫번째글의 rownum
	protected int pageSize;		//한페이지내의 글개수
	protected int firstBlockPage;	//현재 블록의 첫번째 페이지
	protected int lastBlockPage;	//현재 블록의 마지막 페이지
	protected int totalPage;		//최대 페이지 수
	protected int totalRecord;	//최대 레코드 수
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getFirstRowNum() {
		return firstRowNum;
	}
	public void setFirstRowNum(int firstRowNum) {
		this.firstRowNum = firstRowNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstBlockPage() {
		return firstBlockPage;
	}
	public void setFirstBlockPage(int firstBlockPage) {
		this.firstBlockPage = firstBlockPage;
	}
	public int getLastBlockPage() {
		return lastBlockPage;
	}
	public void setLastBlockPage(int lastBlockPage) {
		this.lastBlockPage = lastBlockPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + ", type=" + type + ", currentPage=" + currentPage + ", firstRowNum="
				+ firstRowNum + ", pageSize=" + pageSize + ", firstBlockPage=" + firstBlockPage + ", lastBlockPage="
				+ lastBlockPage + ", totalPage=" + totalPage + ", totalRecord=" + totalRecord + "]";
	}
	
}
