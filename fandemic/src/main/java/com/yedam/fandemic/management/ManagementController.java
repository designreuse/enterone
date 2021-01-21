package com.yedam.fandemic.management;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;


@Controller
public class ManagementController {
	@Autowired CompanyServiceD companyService;
	
	@RequestMapping(value="/management")
	public String Main(Model model,Company company, HttpSession session){
		company = (Company) session.getAttribute("company");
		
		System.out.println("넘어오나"+company);
		// 팬 수 (차트)
		List<HashMap<String, Object>> stCnt = new ArrayList<HashMap<String, Object>>();
		stCnt = companyService.fanCount(company);
		model.addAttribute("stCnt", stCnt);
		model.addAttribute("company", company);
		return "mgt/main";
	}

	@RequestMapping(value="/management/Logout")
	public String LogOut(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		request.getSession(true).invalidate();
		return "redirect:/";
	}
	
}
