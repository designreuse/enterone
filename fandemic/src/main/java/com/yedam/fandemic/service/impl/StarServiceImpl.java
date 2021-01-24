package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.StarMapper;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Fboard;
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

	@Override
	public Fan getFanInfo(Fan fan) {
		return starDAO.getFanInfo(fan);
	}

	@Override
	public Company getProfileCompany(Company company) {
		return starDAO.getProfileCompany(company);
	}

	@Override
	public int getCountFan(Star star) {
		return starDAO.getCountFan(star);
	}

	@Override
	public int getCountFboard(Star star) {
		return starDAO.getCountFboard(star);
	}

	@Override
	public int getCountReply(Star star) {
		return starDAO.getCountReply(star);
	}

	@Override
	public int getCountSboard(Star star) {
		return starDAO.getCountSboard(star);
	}

	@Override
	public List<Art> getStarArtList(Art art) {
		return starDAO.getStarArtList(art);
	}

	@Override
	public List<Fboard> getFboardPicList(Fboard fboard) {
		return starDAO.getFboardPicList(fboard);
	}

	@Override
	public Fan getFanNameCheck(Fan fan) {
		return starDAO.getFanNameCheck(fan);
	}
	
	@Override
	public Fan getFanNameOutCheck(Fan fan) {
		return starDAO.getFanNameOutCheck(fan);
	}
	
	@Override
	public int updateFanName(Fan fan) {
		return starDAO.updateFanName(fan);
	}

	@Override
	public int deleteFan(Fan fan) {
		return starDAO.deleteFan(fan);
	}

	@Override
	public int deleteFanAllFboard(Fan fan) {
		return starDAO.deleteFanAllFboard(fan);
	}

	@Override
	public int deleteFanAllReply(Fan fan) {
		return starDAO.deleteFanAllReply(fan);
	}

}
