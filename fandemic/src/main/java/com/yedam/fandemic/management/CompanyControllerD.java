package com.yedam.fandemic.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;

@Controller
public class CompanyControllerD {
	@Autowired CompanyServiceD companyService;
	
	//소속사 마이페이지 정보조회
	@RequestMapping(value="/management/company/myPage")
	public String myPage(Model model, Company company) {
		model.addAttribute("company",companyService.getMyCompanyInfo(company));
		return "mgt/company/myPage";
	}
}
