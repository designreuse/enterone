package com.yedam.fandemic.impl;


import java.util.List;

import com.yedam.fandemic.vo.Aboard;
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
	public Activity activityDetail(Activity activity);
	//연습생 활동 지원 글 수정
	public int activityUpdate(Activity activity); 
	//수정을 위한 select
	public List<Activity> activityUpdateselect(Activity activity);
	//연습생 활동 지원 글 삭제
	public int activityDelete(Activity activity);
	//오디션 공고 목록
	public List<Aboard> auditionlist();
	//소속사별 오디션 목록
	public List<Aboard> getComList(Aboard aboard);
	//단건 조회
	public Aboard getAboardInfo(Aboard aboard);
	
	

}
