package com.yedam.fandemic.service;

import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Trainee;

public interface AuditionService {
	//활동지원글 등록
	public int insertac(Activity activity);
	//연습생 글 등록
	public int inserttr(Trainee trainee);
}
