package com.yedam.fandemic.star;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.fandemic.service.FboardService;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Member;

@Controller
public class FboardController {
	@Autowired
	FboardService fboardService;

	// 소속사 공지사항 등록
	@RequestMapping(value = "/star/fanBoard/write/insert")
	public String noticesInsert(Fboard fboard,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    fboard.setMem_id(member.getMem_id());
		fboardService.insertFboard(fboard);
		return "star/star_fan_board";
	}
}




