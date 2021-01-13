package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

public interface StarMapperD {
	public List<Star> getStarMemberList(Star star);
	public int getStarIdCheck(Star star); //스타회원가입 ID중복체크
	public int InsertStar(Star star);//스타회원 등록
	public Star getStarDetail(Star star); //스타회원 상세정보 조회
	public int updateStarMember(Star star); //스타회원정보 수정(업데이트)
	public int deleteStarMember(Star star); //스타회원삭제
	public int insertStarSchedule(Schedule schedule);//스타 스케줄 등록
	public List<Schedule> getStartList(Schedule schedule);//스타 스케줄 목록 조회
	public int updateStarSchedule(Schedule schedule); //스타 스케줄 수정
	public int deleteStarSchedule(Schedule schedule); //스타 스케줄 삭제
	public List<Art> getStarWorkList(Art art); //스타 작품 목록 요청
	public int insertStarWork(Art art); //스타 작품등록
	public int deleteStarWork(Art art); //스타 작품 삭제
	public Art starWorkDetail(Art art); //스타 작품 상세보기
	public int updateStarWork(Art art); //스타작품 수정
}
