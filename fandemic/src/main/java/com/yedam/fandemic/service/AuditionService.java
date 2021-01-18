package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Audition;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Trainee;

public interface AuditionService {
	//활동지원글 등록
	public int insertac(Activity activity);
	//연습생 글 등록
	public int inserttr(Trainee trainee);
	//활동지원글 수정
	public int activityUpdate(Activity activity);
	//연습생 활동 수정을 위한 조회
	public List<Activity> activityUpdateselect(Activity activity);
	//활동지원글 삭제
	public int activityDelete(Activity activity);
	//오디션 공고 목록
	public List<Aboard> auditionlist();
	//소속사별 오디션 공고 목록
	public List<Aboard> getComList(Aboard aboard);
	//단건조회
	public Aboard getAboardInfo(Aboard aboard);
	//오디션 지원자 등록
	public int insertau(Audition audition);
	//페이징네이션
	public int getactivityCount(Activity activity);
	//연습생 활동 목록
	public List<Activity> selectac(Activity activity);
	//연습생 수정
	public int traineeUpdate(Trainee trainee);
	//연습생 수정을 위한 조회
	public List<Trainee> traineeUpdateselect(Trainee trainee);
	
}
