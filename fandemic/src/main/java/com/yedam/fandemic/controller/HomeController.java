package com.yedam.fandemic.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value="/")
	public ModelAndView Main(HttpServletResponse response) throws IOException{
		return new ModelAndView("index");
	}
	@RequestMapping(value="/adminMain")
	public ModelAndView Admin(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/adminIndex");
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletResponse response) throws IOException{
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/starMain")
	public ModelAndView sns(HttpServletResponse response) throws IOException {
		return new ModelAndView("star/starMain");
	}
}
