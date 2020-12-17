package com.yedam.fandemic.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class LoginController {
	
	
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
	
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(HttpServletRequest request , HttpServletResponse response) throws IOException{

		return new ModelAndView("index");
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