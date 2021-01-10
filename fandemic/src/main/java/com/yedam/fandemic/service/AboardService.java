package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Aboard;

public interface AboardService {
	public List<Aboard> getAboardList(Aboard aboard);//소속사 오디션 공지사항 목록 요청
	public int insertAboard(Aboard aboard); //소속사 오디션 공지사항 등록
	public int deleteAboard(Aboard aboard); //소속사 오디션 공지사항 삭제
	public int updateAboard(Aboard aboard); //소속사 오디션 공지사항 수정
	public Aboard aboardDetail(Aboard aboard);//소속사 오디션 공지사항 상세보기
}
