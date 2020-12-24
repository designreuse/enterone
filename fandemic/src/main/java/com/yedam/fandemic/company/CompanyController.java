package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	@RequestMapping(value="/company")
	public ModelAndView companyMain(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_main");
	}
	
	@RequestMapping(value="/company/home")
	public ModelAndView companyHome(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_home");
	}
	
	@RequestMapping(value="/company/info")
	public ModelAndView companyInfo(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_info");
	}
	
	@RequestMapping(value="/company/notify")
	public ModelAndView companyNotify(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_notify");
	}
	
	@RequestMapping(value="/company/starProfile")
	public ModelAndView companyStarProfile(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star_profile");
	}
	
	@RequestMapping(value="/company/starMembers")
	public ModelAndView companyStarMembers(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star_members");
	}
}
