package com.yedam.fandemic.impl;


import com.yedam.fandemic.vo.Trainee;

public interface TraineeMapper {

	//닉네임 중복
	public int nickCheck(Trainee trainee);  
	//연습생 등록
	public int inserttr(Trainee trainee);
}
