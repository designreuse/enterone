package com.yedam.fandemic.impl;


import java.util.List;

import com.yedam.fandemic.vo.Activity;

import com.yedam.fandemic.vo.Trainee;

public interface TraineeMapper {

	//닉네임 중복
	public int nickCheck(Trainee trainee);  
	//연습생 등록
	public void inserttr(Trainee trainee);
	//연습생 활동 글 전체 조회
	public List<Activity> selectActivity(Activity Activity);
	

}
