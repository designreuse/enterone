package com.yedam.fandemic.service;

import java.util.List;


import com.yedam.fandemic.vo.Activity;

import com.yedam.fandemic.vo.Trainee;

public interface AuditionService {
	//활동지원글 등록
	public int insertac(Activity activity);
	//연습생 글 등록
	public int inserttr(Trainee trainee);
	//활동지원글 수정
	public int activityUpdate(Activity activity);
	//수정을 위한 조회
	public List<Activity> activityUpdateselect(Activity activity);
	//활동지원글 삭제
	public int activityDelete(Activity activity);
}
