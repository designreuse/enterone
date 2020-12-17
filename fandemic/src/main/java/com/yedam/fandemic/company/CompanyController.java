package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	@RequestMapping(value="/company")
	public ModelAndView login(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company");
	}
}
