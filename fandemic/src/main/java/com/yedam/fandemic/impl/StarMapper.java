package com.yedam.fandemic.impl;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Star;

public interface StarMapper {
	public Star getStarMain(Star star); // 소속사 소개 페이지 출력
	public int insertFan(Fan fan);
	public Fan getFanInfo(Fan fan);
	public Company getProfileCompany(Company company);
	public int getCountFan(Star star);
	public int getCountFboard(Star star);
	public int getCountReply(Star star);
	public int getCountSboard(Star star);

}
