package com.finalTotal.dinner.food.model;

import java.util.List;

public class FoodItemListVO {
	
	private List<FoodItemVO2> fdlist;

	public List<FoodItemVO2> getFdlist() {
		return fdlist;
	}

	public void setFdlist(List<FoodItemVO2> fdlist) {
		this.fdlist = fdlist;
	}

	@Override
	public String toString() {
		return "FoodItemListVO [fdlist=" + fdlist + "]";
	}

	
	
	
}
