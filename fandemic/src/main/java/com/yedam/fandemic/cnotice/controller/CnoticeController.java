package com.yedam.fandemic.cnotice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.fandemic.impl.CnoticeMapper;
import com.yedam.fandemic.vo.Cnotice;

@Controller
public class CnoticeController {
	@Autowired
	CnoticeMapper cnoticedao;

	@RequestMapping(value = "/management/notices")
	public String Notices() {
		return "mgt/notices";
	}

	@RequestMapping(value = "/management/noticesInsertForm")
	public String noticesInsertForm() {
		return "mgt/noticesInsertForm";
	}

	// 소속사 공지사항 등록
	@RequestMapping(value = "/management/noticesInsert")
	public String noticesInsert(Cnotice cnotice) {
		cnoticedao.insertCnotice(cnotice);
		return "mgt/notices";
	}
	
	//소속사 공지사항 목록 조회
	@RequestMapping(value="/management/noticesList")
	@ResponseBody
	public List<Cnotice> getCnoticeList(Cnotice cnotice) {	
		return cnoticedao.getCnoticeList(cnotice);
	}
	
}
