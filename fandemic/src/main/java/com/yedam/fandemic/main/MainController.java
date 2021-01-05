package com.yedam.fandemic.main;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AdminMapper;
import com.yedam.fandemic.impl.MainMapper;
import com.yedam.fandemic.vo.Goods;

@Controller
public class MainController {
	@Autowired MainMapper dao;
	
	
	@RequestMapping(value="/")
	public ModelAndView Main(Model model) throws IOException{
		
		return new ModelAndView("redirect:index");
	} 
	
	
	@RequestMapping(value="/index")
	public ModelAndView index(Model model, Goods goods, HttpSession session) throws IOException{
		
		// session.setAttribute("member", session.getAttribute("member"));
		model.addAttribute("goods", dao.ticketList());
		return new ModelAndView("index");
	}
	
//	@RequestMapping(value="/login")
//	public ModelAndView login(HttpServletResponse response) throws IOException{
//		return new ModelAndView("login");
//	}
	
}
