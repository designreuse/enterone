package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.StarMapperD;
import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.vo.Star;

@Service
public class StarServiceImplD implements StarServiceD{

	@Autowired StarMapperD starDAO;
	
	@Override
	public List<Star> getStarMemberList(Star star) {
		return starDAO.getStarMemberList(star);
	}

	@Override
	public Star getStarIdCheck(Star star) {
		return starDAO.getStarIdCheck(star);
	}

	
	
}
