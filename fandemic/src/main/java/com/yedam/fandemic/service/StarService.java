package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Star;

public interface StarService {
	public Star getStarMain(Star star); // 소속사 소개 페이지 출력
	public int insertFan(Fan fan);		// 채널 팬 가입
	public Fan getFanInfo(Fan fan);
	public Company getProfileCompany(Company company);
	public int getCountFan(Star star);
	public int getCountFboard(Star star);
	public int getCountReply(Star star);
	public int getCountSboard(Star star);
	public List<Art> getStarArtList(Art art);
}
