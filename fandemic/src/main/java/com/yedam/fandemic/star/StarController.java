package com.yedam.fandemic.star;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.service.StarService;
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
