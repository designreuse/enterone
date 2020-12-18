package com.yedam.fandemic.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MemberMapper;
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
	public ModelAndView memberLogin(HttpServletRequest request , HttpServletResponse response) throws IOException{
		
		Member member = new Member();
		
		member.setMem_id(request.getParameter("memId"));
		member.setMem_pw(request.getParameter("memPw"));
		member = memMapper.memLogin(member);
		
		if ( member != null) {
			
			HttpSession session = request.getSession(false);
			session.setAttribute("memId", member.getMem_id());
			session.setAttribute("memPw", member.getMem_pw());
			session.setAttribute("memName", member.getMem_name());
			
			request.setAttribute("login", "success");
			
			return new ModelAndView("index");
			
		} else {
			
			request.setAttribute("login", "fail");
			return new ModelAndView("login");
		}
		
		
		
		
	}
	
	@RequestMapping("/register")
	public ModelAndView register(HttpServletResponse response) throws IOException{
		System.out.println("회원가입");
		return new ModelAndView("login/register");
	}
	   
	
	
	@RequestMapping(value="/adminLogin")
	public ModelAndView adminLogin(HttpServletResponse response) throws IOException{
		System.out.println("어드민 로그인");
		return new ModelAndView("adminLogin");
	}
	
	
	
	

	@RequestMapping(value="/companyLogin")
	public ModelAndView companyLogin(HttpServletResponse response) throws IOException{
		System.out.println("소속사 로그인");
		
		
		
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/starLogin")
	public ModelAndView starLogin(HttpServletResponse response) throws IOException{
		System.out.println("스타 로그인");
		
		
		
		return new ModelAndView("index");
	}
	
	
	
}