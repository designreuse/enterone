package com.yedam.fandemic.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AdminMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Filter;



@Controller
public class AdminController {
	@Autowired AdminMapper dao;
	
	@RequestMapping(value="/adminMain")
	public ModelAndView Main() throws IOException{
		return new ModelAndView("admin/adminmain");
	}
	     
	
	@RequestMapping("/adminNotic")
	public String adminNotic() throws IOException{
		
		return "redirect:notice";
	}
	
	
	@RequestMapping("/adminQuestion")
	public String adminQuestion() throws IOException{
		
		return "redirect:question";
	}
	
	// 개인회원 목록
	@RequestMapping("/adminMember")
	public String adminMember(Model model) throws IOException{
		
		model.addAttribute("member", dao.memberList());
		return "admin/memberList";
		
	}
	// 기업회원 목록
	@RequestMapping("/adminCompany")
	public String adminCompany(Model model) throws IOException{
		
		model.addAttribute("company", dao.companyList());
	
		return "admin/companyList";
		
	}
	
	// 금칙어 목록
	@RequestMapping("/adminFilter")
	public String adminFilter(Model model) throws IOException{
		
		model.addAttribute("filter", dao.filterList());

		return "admin/filter";
	}
	
	// 금칙어 등록, 수정
	@RequestMapping("/filterAdd")
	@ResponseBody
	public void filterAdd(Model model, Filter filter, HttpServletRequest request) throws IOException{
		
		filter.setFil_prohibited(request.getParameter("fil_prohibited")); // 금칙어 가져와서
		filter = dao.filterSel(filter); // 중복 확인 후
		
		if (filter != null) { // 중복이면 
			//수정
			filter.setFil_alternative(request.getParameter("fil_alternative")); // 대체어만 넣어서
			dao.filterUpdate(filter); // 수정
			
		} else { // 중복이 아니면
			filter.setFil_prohibited(request.getParameter("fil_prohibited")); //금칙어 다시 넣고
			filter.setFil_alternative(request.getParameter("fil_alternative")); // 대체어도 넣고
			dao.filterAdd(filter); // 등록
		}
		
	}
	
	
	// 금칙어 삭제
	@RequestMapping("/filterDel")
	public String filterDel(Model model) throws IOException{
		
		
		
		
		
		

		return null;
	}
	
	
	
	
	
}
