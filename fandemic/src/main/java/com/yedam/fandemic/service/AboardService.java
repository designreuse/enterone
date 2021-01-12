package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Audition;

public interface AboardService {
	public List<Aboard> getAboardList(Aboard aboard);//소속사 오디션 공지사항 목록 요청
	public int insertAboard(Aboard aboard); //소속사 오디션 공지사항 등록
	public int deleteAboard(Aboard aboard); //소속사 오디션 공지사항 삭제
	public int updateAboard(Aboard aboard); //소속사 오디션 공지사항 수정
	public Aboard aboardDetail(Aboard aboard);//소속사 오디션 공지사항 상세보기
	public List<Audition> getAuditionApplyList(Audition audition); //소속사 각 오디션 별 지원형황 리스트 요청
	public Audition getAuditionApplyDetail(Audition audition); //소속사 각 오디션 별 지원자 상세보기
	public int auditionApplyDelete(Audition audition); //소속사 각오디션별 지원자 리스트 삭제
}
