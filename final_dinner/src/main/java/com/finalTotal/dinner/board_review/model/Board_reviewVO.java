package com.finalTotal.dinner.board_review.model;

import java.util.Date;

public class Board_reviewVO {
/*	CREATE TABLE board_review (
			review_no NUMBER NOT NULL,  후기 번호 
			mem_no NUMBER,  회원 번호 
			res_no NUMBER NOT NULL,  식당 번호 
			food_item_no NUMBER NOT NULL,  메뉴 번호 
			group_no NUMBER,  그룹 번호 
			review_title VARCHAR2(255) NOT NULL,  제목 
			review_contents CLOB,  내용 
			review_grade NUMBER NOT NULL,  평점 
			review_is_mem VARCHAR2(1),  회원여부 
			review_coupon_no NUMBER,  쿠폰번호 
			review_meal_date DATE NOT NULL,  식사날짜 
			review_recommend NUMBER NOT NULL,  추천수 
			review_hits NUMBER,  조회수 
			review_regdate DATE NOT NULL  등록일 
		);*/
	private int reviewNo, memNo, resNo, foodItemNo, groupNo, reviewGrade,
			reviewCouponNo, reviewRecommend, reviewHits;
	private String reviewTitle, reviewContents, reviewIsMem;
	private Date reviewMealDate, reviewRegdate;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getFoodItemNo() {
		return foodItemNo;
	}
	public void setFoodItemNo(int foodItemNo) {
		this.foodItemNo = foodItemNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public int getReviewCouponNo() {
		return reviewCouponNo;
	}
	public void setReviewCouponNo(int reviewCouponNo) {
		this.reviewCouponNo = reviewCouponNo;
	}
	public int getReviewRecommend() {
		return reviewRecommend;
	}
	public void setReviewRecommend(int reviewRecommend) {
		this.reviewRecommend = reviewRecommend;
	}
	public int getReviewHits() {
		return reviewHits;
	}
	public void setReviewHits(int reviewHits) {
		this.reviewHits = reviewHits;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getReviewIsMem() {
		return reviewIsMem;
	}
	public void setReviewIsMem(String reviewIsMem) {
		this.reviewIsMem = reviewIsMem;
	}
	public Date getReviewMealDate() {
		return reviewMealDate;
	}
	public void setReviewMealDate(Date reviewMealDate) {
		this.reviewMealDate = reviewMealDate;
	}
	public Date getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	@Override
	public String toString() {
		return "Board_reviewVO [reviewNo=" + reviewNo + 
				", memNo=" + memNo + 
				", resNo=" + resNo + 
				", foodItemNo=" + foodItemNo + 
				", groupNo=" + groupNo + 
				", reviewGrade=" + reviewGrade + 
				", reviewCouponNo=" + reviewCouponNo + 
				", reviewRecommend=" + reviewRecommend + 
				", reviewHits=" + reviewHits + 
				", reviewTitle=" + reviewTitle + 
				", reviewContents=" + reviewContents + 
				", reviewIsMem=" + reviewIsMem + 
				", reviewMealDate=" + reviewMealDate + 
				", reviewRegdate=" + reviewRegdate + "]";
	}
	
}
