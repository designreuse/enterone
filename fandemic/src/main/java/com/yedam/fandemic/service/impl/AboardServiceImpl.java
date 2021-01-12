package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.AboardMapper;
import com.yedam.fandemic.service.AboardService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Audition;

@Service
public class AboardServiceImpl  implements AboardService{
	@Autowired AboardMapper dao;
	
	
	@Override
	public List<Aboard> getAboardList(Aboard aboard) {
		return dao.getAboardList(aboard); //오디션 공지사항 목록 요청
	}


	@Override //소속사 오디션 공지사항 등록
	public int insertAboard(Aboard aboard) {
		return dao.insertAboard(aboard);
	}


	@Override //소속사 오디션 공지사항 삭제
	public int deleteAboard(Aboard aboard) {
		return dao.deleteAboard(aboard);
	}


	@Override //소속사 오디션 공지사항 상세보기
	public Aboard aboardDetail(Aboard aboard) {
		return dao.aboardDetail(aboard);
	}


	@Override //소속사 오디션 공지사항 수정
	public int updateAboard(Aboard aboard) {
		return dao.updateAboard(aboard);
	}


	@Override
	public List<Audition> getAuditionApplyList(Audition audition) {
		return dao.getAuditionApplyList(audition);
	}


	@Override
	public Audition getAuditionApplyDetail(Audition audition) {
		return dao.getAuditionApplyDetail(audition);
	}


	@Override
	public int auditionApplyDelete(Audition audition) {
		return dao.auditionApplyDelete(audition);
	}

}
