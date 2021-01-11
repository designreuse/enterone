package com.yedam.fandemic.untact;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.UntactMapper;
import com.yedam.fandemic.vo.Untact;

@Controller
public class UntactController {
	
	@Autowired UntactMapper dao;
	
	@RequestMapping(value = "/untact")
	public ModelAndView test(Model model) throws IOException {
		model.addAttribute("unList", dao.untactList());
		
		  
		
		
		return new ModelAndView("untact/untact");
	}

	@RequestMapping(value = "/ticket")
	public ModelAndView test1(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/ticket");
	}

	@RequestMapping(value = "/ticketReserv")
	public ModelAndView test2(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/ticket_reserv");
	}

	@RequestMapping(value = "/ticketReservList")
	public ModelAndView test3(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/ticket_reserv_list");
	}
}
