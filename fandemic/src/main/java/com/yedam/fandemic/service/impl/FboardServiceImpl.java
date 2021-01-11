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

	@Override
	public int updateFboard(Fboard fboard) {
		return fboardDAO.updateFboard(fboard);
	}

	@Override
	public int updateFboardViews(Fboard fboard) {
		return fboardDAO.updateFboardViews(fboard);
	}

	@Override
	public int deleteFboard(Fboard fboard) {
		return fboardDAO.deleteFboard(fboard);
	}

	@Override
	public List<Fboard> getFboardHashtagList(Fboard fboard) {
		return fboardDAO.getFboardHashtagList(fboard);
	}

	@Override
	public List<Fboard> getFboardSubjectList(Fboard fboard) {
		return fboardDAO.getFboardSubjectList(fboard);
	}

	@Override
	public int getFboardCount(Fboard fboard) {
		return fboardDAO.getFboardCount(fboard);
	}
	
}
