package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Star;

public interface StarMapperD {
	public List<Star> getStarMemberList(Star star);
	public Star getStarIdCheck(Star star); //스타회원가입 ID중복체크
}
