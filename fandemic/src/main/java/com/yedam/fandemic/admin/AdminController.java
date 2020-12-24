package com.yedam.fandemic.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminController {
	
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
	// 기업회원 목록
	
	// 금칙어 대체어 목록 및 등록.삭제
	
	
	
	
	
	
}
