package com.yedam.fandemic.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ManagementController {
	
//	@RequestMapping(value="/management")
//	public ModelAndView Main(HttpServletResponse response) throws IOException{
//		return new ModelAndView("mgt/main");
//	}
	@RequestMapping(value="/management")
	public String Main(){
		return "mgt/main";
	}
	
	@RequestMapping(value="/management/starRM")
	public String StarRM(){
		return "mgt/starRM";
	}
	
	
}
