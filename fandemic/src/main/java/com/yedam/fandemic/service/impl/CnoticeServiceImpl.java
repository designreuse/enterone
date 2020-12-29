package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.CnoticeMapper;
import com.yedam.fandemic.service.CnoticeService;
import com.yedam.fandemic.vo.Cnotice;

@Service
public class CnoticeServiceImpl implements CnoticeService{
	
	@Autowired CnoticeMapper cnoticeDAO;
	
	@Override
	public int insertCnotice(Cnotice cnotice) {		
		return cnoticeDAO.insertCnotice(cnotice);
	}

	@Override
	public int updateCnotice(Cnotice cnotice) {
		return cnoticeDAO.updateCnotice(cnotice);
	}

	@Override
	public int deleteCnotice(Cnotice cnotice) {
		return cnoticeDAO.deleteCnotice(cnotice);
	}

	@Override
	public List<Cnotice> getCnoticeList(Cnotice cnotice) {
		return cnoticeDAO.getCnoticeList(cnotice);
	}

	@Override
	public Cnotice getCnoticeDetail(Cnotice cnotice) {
		return cnoticeDAO.getCnoticeDetail(cnotice);
	}

}
