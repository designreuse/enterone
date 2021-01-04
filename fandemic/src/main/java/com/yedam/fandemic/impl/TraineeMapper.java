package com.yedam.fandemic.impl;

import com.yedam.fandemic.vo.Trainee;

public interface TraineeMapper {

	//닉네임 중복
	public int nickCheck(Trainee trainee);  
}
