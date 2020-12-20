package com.yedam.fandemic.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class AdminController {
	@RequestMapping(value="/adminMain")
	public ModelAndView Main(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/admin");
	}
}
