package com.yedam.fandemic.management.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagementController {
	@RequestMapping(value="/management")
	public ModelAndView Main(HttpServletResponse response) throws IOException{
		return new ModelAndView("mgt/main");
	}
	
	@RequestMapping(value="/management/notices")
	public ModelAndView Notices(HttpServletResponse response) throws IOException{
		return new ModelAndView("mgt/notices");
	}
	@RequestMapping(value="/management/editors")
	public ModelAndView Editors(HttpServletResponse response) throws IOException{
		return new ModelAndView("mgt/editors");
	}
	
}
