package com.finalTotal.dinner.member.model;

import java.util.List;

public class MemberListVO {
	private List<MemberVO> items;

	public List<MemberVO> getItems() {
		return items;
	}
	public void setItems(List<MemberVO> items) {
		this.items = items;
	}
	
	@Override
	public String toString() {
		return "MemberListVO [items=" + items + "]";
	}
}
