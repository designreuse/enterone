package com.yedam.fandemic.star;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StarController {
	@RequestMapping(value = "/starMain")
	public ModelAndView starMain(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_main");
	}
	@RequestMapping(value = "/starSchedule ")
	public ModelAndView starSchedule(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_schedule");
	}
	@RequestMapping(value = "/starLive")
	public ModelAndView starLive(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_live");
	}
	@RequestMapping(value = "/starBoard")
	public ModelAndView starBoard(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_board");
	}
	@RequestMapping(value = "/starFanBoard")
	public ModelAndView starFanBoard(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_fan_board");
	}
	@RequestMapping(value = "/starAlbum")
	public ModelAndView starAlbum(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_album");
	}
}
