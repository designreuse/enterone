package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.AboardMapper;
import com.yedam.fandemic.service.AboardService;
import com.yedam.fandemic.vo.Aboard;

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


	@Override
	public int deleteAboard(Aboard aboard) {
		return dao.deleteAboard(aboard);
	}

}
