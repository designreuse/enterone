package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.CompanyMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Star;

@Controller
public class CompanyController {
	@Autowired
	CompanyMapper companyDAO;
	
	//소속사 메인페이지. 소속사 리스트를 출력한다.
	@RequestMapping(value="/company")
	public ModelAndView companyMain(Model model, Company company) throws IOException{
		model.addAttribute("companyList", companyDAO.getCompanyMinInfo(company));
		return new ModelAndView("company/company_main");
	}
	
	//소속사 홈 메인페이지. 소속사의 스타목록 출력
	@RequestMapping(value="/company/home/{id}")
	public ModelAndView companyHome(@PathVariable String id, Star star, Model model) throws IOException{
		star.setCom_id(id);
		model.addAttribute("companyStars", companyDAO.getCompanyStarMin(star));
		return new ModelAndView("company/company_home");
	}
	
	//소속사 홈페이지에서 소속사의 소개화면 출력
	@RequestMapping(value="/company/info/{id}")
	public ModelAndView companyInfo(@PathVariable String id, Company company, Model model) throws IOException{
		company.setCom_id(id);
		model.addAttribute("companyInfo", companyDAO.getCompanyInfo(company));
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
