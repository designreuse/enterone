package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Cnotice;

public interface CnoticeService {
	public int insertCnotice(Cnotice cnotice); //공지사항 등록
	public int updateCnotice(Cnotice cnotice);  //공지사항 수정
	public int deleteCnotice(Cnotice cnotice); //공지사항 삭제.
	public List<Cnotice> getCnoticeList(Cnotice cnotice); //공지사항 전체목록조회
	public Cnotice getCnoticeDetail(Cnotice cnotice); //상세보기, 단건조회
}
