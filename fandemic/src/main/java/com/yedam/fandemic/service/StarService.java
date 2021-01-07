package com.yedam.fandemic.service;

import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Star;

public interface StarService {
	public Star getStarMain(Star star); // 소속사 소개 페이지 출력
	public int insertFan(Fan fan);		// 채널 팬 가입
}
