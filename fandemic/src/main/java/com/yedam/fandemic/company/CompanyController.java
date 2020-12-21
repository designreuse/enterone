package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	@RequestMapping(value="/companyMain")
	public ModelAndView companyMain(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_main");
	}
	
	@RequestMapping(value="/companyHome")
	public ModelAndView companyHome(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_home");
	}
	
	@RequestMapping(value="/companyIntro")
	public ModelAndView companyIntro(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_intro");
	}
	
	@RequestMapping(value="/companyNotify")
	public ModelAndView companyNotify(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_notify");
	}
	
	@RequestMapping(value="/companyStarProfile")
	public ModelAndView companyStarProfile(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star_profile");
	}
	
	@RequestMapping(value="/companyStarMembers")
	public ModelAndView companyStarMembers(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star-members");
	}
}
