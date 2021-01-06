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
	public List<Fboard> fboardList(HttpServletRequest request, Model model, Fboard fboard) {
		
		fboard.setSt_id(request.getParameter("id"));
		return  fboardService.getFboardList(fboard);
	}
	
	//게시물 상세보기
	@RequestMapping(value="/star/fanBoard/read/", method=RequestMethod.GET)
	@ResponseBody
	public Fboard fboardView(HttpServletRequest request, Fboard fboard, Model model) throws IOException {		
		fboard.setFbo_sub_no(request.getParameter("no"));
		fboard.setSt_id(request.getParameter("id"));
		return fboardService.getFboardInfo(fboard);
	}
	
	//입력
	@RequestMapping(value="/star/fanBoard", method=RequestMethod.POST)
	@ResponseBody
	public boolean fboardInsert(HttpServletRequest request, Fboard fboard,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    fboard.setMem_id(member.getMem_id());
	    
		fboardService.insertFboard(fboard);
		return true;
	}
	
	//수정
	@RequestMapping(value="/star/fanBoard/update/", method=RequestMethod.PUT)
	@ResponseBody
	public boolean fboardUpdate(Fboard fboard) throws IOException {
		fboardService.updateFboard(fboard);
		return true;
	}
	
	//조회수 증가
	@RequestMapping(value="/star/fanBoard/viewsUpdate/", method=RequestMethod.PUT)
	@ResponseBody
	public boolean fboardviewsUpdate(HttpServletRequest request, Fboard fboard) throws IOException {
		fboard.setFbo_sub_no(request.getParameter("no"));
		fboard.setSt_id(request.getParameter("id"));
		fboardService.updateFboardViews(fboard);
		return true;
	}
	
	//삭제
	@RequestMapping(value="/star/fanBoard/delete/", method=RequestMethod.DELETE)
	@ResponseBody
	public boolean fboardDelete(HttpServletRequest request, Fboard fboard) throws IOException {
		fboard.setFbo_sub_no(request.getParameter("no"));
		fboard.setSt_id(request.getParameter("id"));
		fboardService.deleteFboard(fboard);
		return true;
	}
}




