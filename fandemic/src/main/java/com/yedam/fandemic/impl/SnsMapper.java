package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Reply;
import com.yedam.fandemic.vo.Sns;
import com.yedam.fandemic.vo.Sreply;

public interface SnsMapper {
//SNS INSERT
	public int insertSns(Sns sns); // 사진 등록

	// SNS SELECT
	public List<Sns> selectSns(Sns sns);

	// SNS 단건조회
	public Sns OneSnsSelect (Sns sns);
	
	// My SNS
	public List<Sns> selectMySns(Sns sns);

	// My SNS count
	public int countMySns(Sns sns);
	
	// My SNS delete
	public int deleteSns(Sns sns);	
	
	// Like 건수 조회
	public int countLike(Sns sns);
	
	// Letter Count
	public int countMyLetter(Sns sns);
	
	// 멤버 단건조회
	public Sns OneMemberSelect (Sns sns);
	
	// 멤버별 포스트 모두 조회 하기
	public List<Sns> myPostList(Sns sns);
	// 멤버별 포스트 페이지네이션
	public int getsnsCount(Sns sns);
	
	
	// 댓글 인서트 하기
	public int insertSre(Sreply sreply);
	
	// 댓글 조회하기
	public List<Sreply> selectSre(Sreply sreply);
	
	// 좋아요 인서트 하기
	public int insertLike(Sns Sns);
	// 좋아요 인서트 하기
	public int deleteLike(Sns Sns);
	
}
