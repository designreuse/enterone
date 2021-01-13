package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.SboardMapper;
import com.yedam.fandemic.service.SboardService;
import com.yedam.fandemic.vo.Sboard;

@Service
public class SboardServiceImpl implements SboardService{
	@Autowired SboardMapper sboardDAO;

	@Override
	public List<Sboard> getSboardList(Sboard sboard) {
		return sboardDAO.getSboardList(sboard);
	}

	@Override
	public Sboard getSboardInfo(Sboard sboard) {
		return sboardDAO.getSboardInfo(sboard);
	}

	@Override
	public List<Sboard> getSboardHashtagList(Sboard sboard) {
		return sboardDAO.getSboardHashtagList(sboard);
	}

	@Override
	public int getSboardCount(Sboard sboard) {
		return sboardDAO.getSboardCount(sboard);
	}

	@Override
	public int insertSboard(Sboard sboard) {
		return sboardDAO.insertSboard(sboard);
	}

	@Override
	public int updateSboard(Sboard sboard) {
		return sboardDAO.updateSboard(sboard);
	}

	@Override
	public int deleteSboard(Sboard sboard) {
		return sboardDAO.deleteSboard(sboard);
	}
	
	
}
