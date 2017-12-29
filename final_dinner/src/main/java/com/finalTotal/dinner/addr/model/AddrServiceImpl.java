package com.finalTotal.dinner.addr.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddrServiceImpl implements AddrService{
	
	@Autowired
	private AddrDAO addrDAO;

	@Override
	public List<SidoVO> selectSido() {
		return addrDAO.selectSido();
	}

	@Override
	public List<SigunguVO> selectSigungu(int sigunguNo) {
		return addrDAO.selectSigungu(sigunguNo);
	}

	@Override
	public List<AddrVO> selectAddr() {
		return addrDAO.selectAddr();
	}

	@Override
	public List<SidoVO> allSido() {
		return addrDAO.allSido();
	}

	@Override
	public List<SigunguVO> allSigungu(int sidoNo) {
		return addrDAO.allSigungu(sidoNo);
	}
	
}
