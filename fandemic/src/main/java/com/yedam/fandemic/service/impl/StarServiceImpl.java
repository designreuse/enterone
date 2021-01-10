package com.yedam.fandemic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.StarMapper;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Star;

@Service
public class StarServiceImpl implements StarService{
	@Autowired StarMapper starDAO;

	@Override
	public Star getStarMain(Star star) {
		return starDAO.getStarMain(star);
	}

	@Override
	public int insertFan(Fan fan) {
		return starDAO.insertFan(fan);
	}
}
