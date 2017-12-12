package com.finalTotal.dinner.board.model;

public class SearchVO {
	private String keyword;		//검색어
	private String type="free_title";		//검색종류(name, title, content)
	private int CurrentPage=1;	//현재페이지
	private int firstRowNum;	//현재 페이지의 첫번째글의 rownum
	private int pageSize;		//페이지내의 글개수
	
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
		if("title".equals(type)
				|| "contents".equals(type)
				|| "name".equals(type)) {
			this.type = "free_"+type;
		}
	}
	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
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
	
	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + ", type=" + type + ", CurrentPage=" + CurrentPage + ", firstRowNum="
				+ firstRowNum + ", pageSize=" + pageSize + "]";
	}
	
}
