package com.yedam.fandemic.audition;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuditionController {
	@RequestMapping(value = "/auditionwork") //주소
	public ModelAndView auditionwork(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_list");
	
	}	
	
	@RequestMapping(value = "/auditionapply") //주소
	public ModelAndView auditioninsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/audition_apply");
	
	}	
	
	@RequestMapping(value = "/auditionprofile") //주소
	public ModelAndView auditionprofile(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_profile");
	
	}	
	
	@RequestMapping(value = "/traineeinsert") //주소
	public ModelAndView traineeinsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_insert");
	
	}	
	
}
