package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Cnotice;

public interface CnoticeMapper {

	public int insertCnotice(Cnotice cnotice); //공지사항 등록
	public List<Cnotice> getCnoticeList(Cnotice cnotice); //공지사항 전체목록조회
	public Cnotice getCnoticeDetail(Cnotice cnotice); //상세보기, 단건조회
}
