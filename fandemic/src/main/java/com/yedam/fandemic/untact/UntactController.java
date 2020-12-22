package com.yedam.fandemic.untact;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UntactController {
	@RequestMapping(value = "/untact")
	public ModelAndView test(HttpServletResponse response) throws IOException {
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
