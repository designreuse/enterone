package com.yedam.fandemic.impl;


import java.util.List;
import java.util.Map;

import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Audition;
import com.yedam.fandemic.vo.QnA;
import com.yedam.fandemic.vo.Trainee;

public interface AuditionMapper {

	//닉네임 중복
	public int nickCheck(Trainee trainee);  
	//연습생 등록
	public int inserttr(Trainee trainee);
	//연습생 활동 글 등록
	public int insertac(Activity activity);
	//연습생 활동 글 전체 조회
	public List<Activity> selectac();
	//연습생 활동 지원 글 삭제
	public int activityDelete(Activity activity);
	//오디션 공고 목록
	public List<Aboard> auditionlist();
	//소속사별 오디션 목록
	public List<Aboard> getComList(Aboard aboard);
	//오디션 목록 단건 조회
	public Aboard getAboardInfo(Aboard aboard);
	//오디션 지원자 등록
	public int insertau(Audition audition);
	//최신순
	public List<Map<String, Object>> selectnew();
	//페이징
	public int getactivityCount(Activity activity);
	//연습생 목록
	public List<Trainee> selecttr();
	//연습생 수정
	public void traineeUpdate(Trainee trainee); 
	//수정을 위한 연습생 select
	public Trainee traineeUpdateselect(Trainee trainee);
	//연습생 상세프로필(단건조회)
	public Activity activityDetail(Activity activity);
	//연습생 활동 수정을 위한 select
	public Activity activityUpdateselect(Activity activity);
	//연습생 활동 지원 글 수정
	public int activityUpdate(Activity activity); 
	//조회수 증가
	public int updateActivityhits(Activity activity);
	
	public Aboard aboard(Aboard aboard);
	
	
	public Aboard insertselect(Aboard aboard);
	
	
}
