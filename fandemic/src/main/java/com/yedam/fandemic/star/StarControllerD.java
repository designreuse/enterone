package com.yedam.fandemic.star;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.vo.Star;

@Controller
public class StarControllerD {
	
	@Autowired StarServiceD starService; 
	
	//소속사 스타관리 페이지 이동
	@RequestMapping(value="/management/starManagement")
	public String StarManagement(){
		return "mgt/starManagement";
	}
	
	
	//소속사 스타회원 리스트 출력
	@RequestMapping(value="/management/starMemberList")
	@ResponseBody //결과를 Json형태로 변환
	public List<Star> getStarMemberList(Star star){
		return starService.getStarMemberList(star);
	}
	
	//소속사 스타회원 등록 페이지 이동
	@RequestMapping(value="/management/starInsertForm")
	public String StarInsertForm() {
		return "mgt/starInsertForm";
	}
}
