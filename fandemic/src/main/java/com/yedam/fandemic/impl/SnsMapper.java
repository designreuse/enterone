package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Sns;

public interface SnsMapper {
//SNS INSERT
	public int insertSns(Sns sns); // 사진 등록

	// SNS SELECT
	public List<Sns> selectSns(Sns sns);

	// My SNS
	public List<Sns> selectMySns(Sns sns);

	// My SNS count
	public int countMySns(Sns sns);
	
	// Like 건수 조회
	public int countLike(Sns sns);
	// SNS 단건조회
	public Sns OneSnsSelect (Sns sns);
	
	// Letter Count
	public int countMyLetter(Sns sns);
	
	// 멤버 단건조회
	public Sns OneMemberSelect (Sns sns);
	
	// 멤버별 포스트 모두 조회 하기
	public List<Sns> myPostList(Sns sns);
	// 멤버별 포스트 페이지네이션
	public int getsnsCount(Sns sns);
	
}
