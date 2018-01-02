package com.finalTotal.dinner.restaurant.search.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.finalTotal.dinner.common.SearchVO;

public class RestaruntSearchVO extends SearchVO{
	private String location;
	private List<Map<String, String>> locationList;
	private int resTypeNo;
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Map<String, String>> getLocationList() {
		if(location!=null && !location.isEmpty()) {
			StringTokenizer st=new StringTokenizer(location, ",");
			
			ArrayList<Map<String, String>> list=new ArrayList<Map<String, String>>();
			
			while(st.hasMoreTokens()) {
				String token=st.nextToken();
				String[] data=token.split("-");
				if(data.length==2
						&& data[0]!=null && !data[0].isEmpty()
						&& data[1]!=null && !data[1].isEmpty()) {
					HashMap<String, String> map=new HashMap<String, String>();
					
					map.put("sido", data[0]);
					map.put("sigungu", data[1]);
					
					list.add(map);
				}
			}
			
			locationList=list;
		}
		return locationList;
	}

	public void setLocationList(List<Map<String, String>> locationList) {
		this.locationList = locationList;
	}
	
	public int getResTypeNo() {
		return resTypeNo;
	}

	public void setResTypeNo(int resTypeNo) {
		this.resTypeNo = resTypeNo;
	}

	@Override
	public String toString() {
		return "RestaruntSearchVO [location=" + location + ", locationList=" + locationList + ", resTypeNo=" + resTypeNo
				+ ", keyword=" + keyword + ", type=" + type + ", currentPage=" + currentPage + ", firstRowNum="
				+ firstRowNum + ", pageSize=" + pageSize + ", firstBlockPage=" + firstBlockPage + ", lastBlockPage="
				+ lastBlockPage + ", totalPage=" + totalPage + "]";
	}
	
}