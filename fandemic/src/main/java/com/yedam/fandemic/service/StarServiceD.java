package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Star;

public interface StarServiceD {
	public List<Star> getStarMemberList(Star star); //스타회원 전체조회
	public Star getStarIdCheck(Star star); //스타회원가입 ID중복체크
	
}
