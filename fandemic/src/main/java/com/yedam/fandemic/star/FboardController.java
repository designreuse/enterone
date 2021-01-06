package com.yedam.fandemic.star;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.service.FboardService;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

@Controller
public class FboardController {
	@Autowired
	FboardService fboardService;
	StarService starService;
	
	//게시물 목록 출력
	@RequestMapping(value="/star/fanBoard/list", method=RequestMethod.GET)
	@ResponseBody
	public List<Fboard> getUserList(HttpServletRequest request, Model model, Fboard fboard) {
		
		fboard.setSt_id(request.getParameter("id"));
		return  fboardService.getFboardList(fboard);
	}
	
	//게시물 상세보기
	@RequestMapping("/star/fanBoard/read/{no}")
	public ModelAndView starSchedule(HttpServletRequest request, 
			@PathVariable String no, Fboard fboard, Star stVo, Model model) throws IOException {
		
//		stVo.setSt_id(request.getParameter("id"));
//		model.addAttribute("star", starService.getStarMain(stVo));
		
		fboard.setFbo_sub_no(no);
		model.addAttribute("fboInfo", fboardService.getFboardInfo(fboard));
		return new ModelAndView("star/star_fan_board_read");
	}
	
	//입력
	@RequestMapping(value="/star/fanBoard", method=RequestMethod.POST)
	@ResponseBody
	public boolean noticesInsert(HttpServletRequest request, Fboard fboard,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    fboard.setMem_id(member.getMem_id());
	    
		fboardService.insertFboard(fboard);
		return true;
	}
}




