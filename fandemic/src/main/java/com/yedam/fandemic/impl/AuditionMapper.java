package com.yedam.fandemic.impl;


import java.util.List;

import com.yedam.fandemic.vo.Activity;

import com.yedam.fandemic.vo.Trainee;

public interface AuditionMapper {

	//닉네임 중복
	public int nickCheck(Trainee trainee);  
	//연습생 등록
	public int inserttr(Trainee trainee);
	//연습생 활동 글 등록
	public int insertac(Activity activity);
	//연습생 활동 글 전체 조회
	public List<Trainee> selectTr();
	//연습생 활동 상세 프로필
	public Activity ActivityDetail(Activity activity);
	
	
	

}
