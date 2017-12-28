package com.finalTotal.dinner.addr.model;

import java.util.List;

public class AddrVO {
	private SidoVO sidoVO;
	private List<SigunguVO> sigunguList;
	
	public SidoVO getSidoVO() {
		return sidoVO;
	}
	public void setSidoVO(SidoVO sidoVO) {
		this.sidoVO = sidoVO;
	}
	public List<SigunguVO> getSigunguList() {
		return sigunguList;
	}
	public void setSigunguList(List<SigunguVO> sigunguList) {
		this.sigunguList = sigunguList;
	}
	
	@Override
	public String toString() {
		return "AddrVO [sidoVO=" + sidoVO + ", sigunguList=" + sigunguList + "]";
	}
	
}
