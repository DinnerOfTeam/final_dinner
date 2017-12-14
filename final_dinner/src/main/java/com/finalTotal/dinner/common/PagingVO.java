package com.finalTotal.dinner.common;

public class PagingVO {
	private int CurrentPage=1;	//현재페이지
	private int pageSize=Utility.PAGE_SIZE;		//페이지내의 레코드수
	private int blockSize=Utility.BLOCK_SIZE;	//한 블럭당 페이지수
	private int totalRecord;	//sql함수 count()를 이용해서 얻은 레코드수
	
	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	private int totalPage;		//최대 페이지 수
	private int firstRowNum;	//현재 페이지의 첫번째글의 rownum-1
	private int lastRowNum;		//현재 페이지의 마지막글의 rownum
	private int firstBlockPage;	//현재 블록의 첫번째 페이지
	private int lastBlockPage;	//현재 블록의 마지막 페이지
	
	public int getTotalPage() {
		totalPage=(int)Math.ceil(totalRecord/(float)blockSize);
		return totalPage;
	}
	public int getFirstRowNum() {
		firstRowNum=pageSize*(CurrentPage-1);
		return firstRowNum;
	}
	public int getLastRowNum() {
		lastRowNum=firstRowNum+pageSize;
		if(lastRowNum>=totalRecord) {
			lastRowNum=totalRecord;
		}
		return lastRowNum;
	}
	public int getFirstBlockPage() {
		firstBlockPage=CurrentPage-(CurrentPage%blockSize)+1;
		return firstBlockPage;
	}
	public int getLastBlockPage() {
		lastBlockPage=firstBlockPage+blockSize-1;
		if(lastBlockPage>totalPage) {
			lastBlockPage=totalPage;
		}
		return lastBlockPage;
	}
	
	@Override
	public String toString() {
		return "PagingVO [CurrentPage=" + CurrentPage + ", pageSize=" + pageSize + ", blockSize=" + blockSize
				+ ", totalRecord=" + totalRecord + ", totalPage=" + totalPage + ", firstRowNum=" + firstRowNum
				+ ", lastRowNum=" + lastRowNum + ", firstBlockPage=" + firstBlockPage + ", lastBlockPage="
				+ lastBlockPage + "]";
	}
	
	
}
