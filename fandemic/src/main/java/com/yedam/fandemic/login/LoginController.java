package com.yedam.fandemic.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;

@Controller
public class LoginController {
	@Autowired MemberMapper memMapper;
	
	@RequestMapping("/logout") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("로그아웃");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		request.setAttribute("login", null);
		
		return new ModelAndView("login");
	}
	    
	// 개인 로그인
	@RequestMapping(value="/memberLogin")
	public String memberLogin(HttpServletRequest request, Model model, Member member) throws IOException{
		
		member = memMapper.memLogin(member);
		
		if ( member != null) {
			
			HttpSession session = request.getSession(false);
			session.setAttribute("mem_id", member.getMem_id());
			session.setAttribute("mem_pw", member.getMem_pw());
			session.setAttribute("mem_name", member.getMem_name());
			
			request.setAttribute("login", "success");
			
			return "index";
			
		} else {
			
			request.setAttribute("login", "fail");
			
			return "login";
		}
		
	} // 개인 로그인
	
	
	//소속사
	@RequestMapping(value="/companyLogin")
	public ModelAndView companyLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		Company company = new Company();
		
		company.setCom_id(request.getParameter("com_id"));
		company.setCom_pw(request.getParameter("com_pw"));
		company = memMapper.comLogin(company);
		
		// 아이디가 있을 때
		if ( company != null) { 
			
			// 일반기업 일 때
			if (company.getCom_class() == "1") {
				
				HttpSession session = request.getSession(false);
				session.setAttribute("com_id", company.getCom_id());
				session.setAttribute("com_pw", company.getCom_pw());
				
				request.setAttribute("login", "success");
				
				return new ModelAndView("mgt/main"); // redirect:
				
			} else { // admin 일 때
				
				HttpSession session = request.getSession(false);
				session.setAttribute("com_id", company.getCom_id());
				
				request.setAttribute("login", "success");
				return new ModelAndView("admin/main");
				
			}

		} else {
			
			request.setAttribute("login", "fail");
			return new ModelAndView("login");
		}
		
		
	}// 소속사 로그인
	
	
	@RequestMapping(value="/starLogin")
	public ModelAndView starLogin(HttpServletResponse response) throws IOException{
		System.out.println("스타 로그인");

		return new ModelAndView("index");
	}

	
	// 회원가입 페이지
	@RequestMapping("/register")
	public ModelAndView register(HttpServletResponse response) throws IOException{
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
	
	
	
	// 개인 회원가입 처리
	@RequestMapping("/memRegister")
	public ModelAndView memRegister(Model model, Member member) throws IOException{
		
		memMapper.memInsert(member);
		
		model.addAttribute("login", "insert");
		
		return new ModelAndView("login");
	}
	
	// 기업 회원가입
	@RequestMapping("/comRegister")
	public ModelAndView comRegister(Model model, Company company) throws IOException{
		memMapper.comInsert(company);
		
		model.addAttribute("login", "insert");
		
		return new ModelAndView("login");
	}
	
	
	
	
	
	@RequestMapping(value="/adminLogin")
	public ModelAndView adminLogin(HttpServletResponse response) throws IOException{
		System.out.println("어드민 로그인");
		return new ModelAndView("adminLogin");
	}
	
	
	
	

	
	
	
	
	
	
}