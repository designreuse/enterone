package com.yedam.fandemic.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ManagementController {
	
	@RequestMapping(value="/management")
	public String Main(){
		return "mgt/main";
	}

	@RequestMapping(value="/management/Logout")
	public String LogOut(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		request.getSession(true).invalidate();
		return "redirect:/";
	}
	
}
