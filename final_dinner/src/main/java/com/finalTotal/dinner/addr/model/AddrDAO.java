package com.finalTotal.dinner.addr.model;

import java.util.List;

public interface AddrDAO {
	public List<SidoVO> selectSido();
	public List<SigunguVO> selectSigungu(int sigunguNo);
	public List<AddrVO> selectAddr();
	public List<SidoVO> allSido();
	public List<SigunguVO> allSigungu(int sidoNo);
}
