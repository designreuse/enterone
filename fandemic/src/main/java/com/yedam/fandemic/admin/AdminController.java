package com.yedam.fandemic.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value="/adminMain")
	public ModelAndView Admin(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/adminIndex");
	}
}
