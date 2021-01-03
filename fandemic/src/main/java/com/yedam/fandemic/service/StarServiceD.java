package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Star;

public interface StarServiceD {
	public List<Star> getStarMemberList(Star star); //스타회원 전체조회
	public Star getStarDetail(Star star); //스타회원 상세정보 조회
	public int getStarIdCheck(Star star); //스타회원가입 ID중복체크
	public int InsertStar(Star star);//스타회원 등록
	public int updateStarMember(Star star);//스타회원정보 수정
	public int deleteStarMember(Star star);//스타회원삭제
	
}
