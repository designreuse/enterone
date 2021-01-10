package com.yedam.fandemic.star;

import java.io.IOException;

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

import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

@Controller
public class StarController {
	@Autowired
	StarService starService;
	
	//스타 메인페이지
	@RequestMapping(value = "/star/{id}")
	public ModelAndView starMain(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_main");
	}
	
	//채널 가입 등록
	@RequestMapping(value="/star/fanBoard/fanJoin", method=RequestMethod.POST)
	@ResponseBody
	public boolean fboardInsert(HttpServletRequest request, Fan fan,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    fan.setMem_id(member.getMem_id());
	    fan.setSt_id(request.getParameter("st_id"));
	    fan.setFan_name(request.getParameter("fan_name"));
	    
	    System.out.println(fan);
	    starService.insertFan(fan);
		return true;
	}
	
	@RequestMapping(value = "/star/schedule/{id}")
	public ModelAndView starSchedule(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_schedule");
	}
	
	@RequestMapping(value = "/star/live/{id}")
	public ModelAndView starLive(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_live");
	}
	
	//스타게시판 이동
	@RequestMapping(value = "/star/board/{id}")
	public ModelAndView starBoard(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_board");
	}
	
	//팬게시판 이동
	@RequestMapping(value = "/star/fanBoard/{id}")
	public ModelAndView starFanBoard(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_fan_board");
	}
	
	//사진게시판 이동
	@RequestMapping(value = "/star/album/{id}")
	public ModelAndView starAlbum(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_album");
	}
	
}
