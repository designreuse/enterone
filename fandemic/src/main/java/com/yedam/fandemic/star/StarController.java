package com.yedam.fandemic.star;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StarController {
	@RequestMapping(value = "/star")
	public ModelAndView starMain(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_main");
	}
	@RequestMapping(value = "/star/schedule ")
	public ModelAndView starSchedule(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_schedule");
	}
	@RequestMapping(value = "/star/live")
	public ModelAndView starLive(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_live");
	}
	@RequestMapping(value = "/star/board")
	public ModelAndView starBoard(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_board");
	}
	@RequestMapping(value = "/star/fanBoard")
	public ModelAndView starFanBoard(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_fan_board");
	}
	@RequestMapping(value = "/star/fanBoard/write")
	public ModelAndView starFanBoardWrite(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_fan_board_write");
	}
	
	@RequestMapping(value = "/star/album")
	public ModelAndView starAlbum(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/star_album");
	}
	
}
