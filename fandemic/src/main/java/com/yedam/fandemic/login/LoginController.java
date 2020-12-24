package com.yedam.fandemic.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

@Controller
public class LoginController {
	@Autowired MemberMapper memMapper;
	
	
	@RequestMapping("/logout") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("로그아웃");
		
		session.invalidate();
		
		request.setAttribute("login", null);
		
		return new ModelAndView("login");
	}
	    
	// 개인 로그인
	@RequestMapping(value="/memberLogin")
	public String memberLogin(HttpServletRequest request,HttpSession session,  Model model, Member member) throws IOException{
		
		member = memMapper.memLogin(member);
		
		if ( member != null) {
			
			session.setAttribute("member", member);
			
			return "index";
			
		} else {
			
			request.setAttribute("login", "fail");
			
			return "login";
		}
		
	} // 개인 로그인
	
	
	//소속사
	@RequestMapping(value="/companyLogin")
	public String companyLogin(Model model, Company company, HttpSession session) {
		
		company = memMapper.comLogin(company); //id와 pw를 받아서 값이 있는지 DB조회
		
		// 아이디가 있을 때
		if ( company != null) {
			
			// 일반기업(소속사) 일 때
			System.out.println("권한: " + company.getCom_class());
			

			if (company.getCom_class().equals("1")) {
				session.setAttribute("company", company);
				
				return "redirect:management"; 
				
			} else { // admin 일 때
				session.setAttribute("company", company);
				
				return "redirect:adminMain";
			}
		//아이디가 DB에없을때
		} else {
			model.addAttribute("login", "fail");
			return "login";
		}
		
		
	}// 소속사 로그인
	
	
	@RequestMapping(value="/starLogin")
	public String starLogin(HttpServletRequest request, Model model, Star star,  HttpSession session) throws IOException{
		System.out.println("스타로그인");
		
		star.setSt_id(request.getParameter("com_id"));
		star.setSt_pw(request.getParameter("com_pw"));
		
		star = memMapper.starLogin(star);
		
		// 아이디가 있을 때
		if ( star != null) {
			
			session.setAttribute("star", star);
			return "redirect:starMain"; 
				
		} else {
			model.addAttribute("login", "fail");
			return "login";
		}
	}

	
	// 회원가입 페이지
	@RequestMapping("/register")
	public ModelAndView register(Model model, Member member, Company company) throws IOException{

		return new ModelAndView("login/register");
	}
	
	// 개인 중복확인
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(Model model, Member member) throws IOException{
		
			System.out.println("개인 중복확인");
			return memMapper.memIdCheck(member);
			
	}
	
	// 기업 중복확인
	@RequestMapping("/checkIdcom")
	@ResponseBody
	public int checkIdcom(Model model, Company company) throws IOException{

			System.out.println("기업 중복확인");
			return memMapper.comIdCheck(company);

	}
	
	// 개인 메일 중복 확인
	@RequestMapping("/memMail")
	@ResponseBody
	public int memMail(Model model, Member member) throws IOException{
		
			System.out.println("개인 메일");
			return memMapper.memMailCheck(member);
			
	}
	
	
	// 기업 메일 중복 확인
	@RequestMapping("/comMail")
	@ResponseBody
	public int comMail(Model model, Company company) throws IOException{
		
			System.out.println("기업 메일");
			return memMapper.comMailCheck(company);
			
	}
	
	
	// 개인 회원가입 처리
	@RequestMapping("/memRegister")
	public String memRegister(Model model,  Company company, Member member, Errors errors) throws IOException{
		
		new MemberValidator().validate(member, errors);
		
		if(errors.hasErrors()) {
			
			return "login/register";
		}
		
		memMapper.memInsert(member);
		model.addAttribute("login", "insert"); // 세션으로 바꿔야 함
		
		return "login";
	}
	
	
	
	// 기업 회원가입
	@RequestMapping("/comRegister")
	public String comRegister(Model model, Member member,  Company company, Errors errors) throws IOException{
		
		new CompanyValidator().validate(company, errors);
		model.addAttribute("tab", "tab-2");
		
		if(errors.hasErrors()) {
			
			return "login/register";
			
		}
		
		memMapper.comInsert(company);
		
		model.addAttribute("login", "insert");
		
		return "login";
	}
	
	
	
	
	
	@RequestMapping("/adminLogin")
	public ModelAndView adminLogin(HttpServletResponse response) throws IOException{
		System.out.println("어드민 로그인");
		return new ModelAndView("adminLogin");
	}
	
	
	
	

	
	
	
	
	
	
}