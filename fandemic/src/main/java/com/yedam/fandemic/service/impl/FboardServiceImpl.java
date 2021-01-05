package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.FboardMapper;
import com.yedam.fandemic.service.FboardService;
import com.yedam.fandemic.vo.Fboard;

@Service
public class FboardServiceImpl implements FboardService{
	@Autowired FboardMapper fboardDAO;
	
	@Override
	public int insertFboard(Fboard fboard) {
		return fboardDAO.insertFboard(fboard);
	}

	@Override
	public List<Fboard> getFboardList(Fboard fboard) {
		return fboardDAO.getFboardList(fboard);
	}

	@Override
	public Fboard getFboardInfo(Fboard fboard) {
		return fboardDAO.getFboardInfo(fboard);
	}
	
}
