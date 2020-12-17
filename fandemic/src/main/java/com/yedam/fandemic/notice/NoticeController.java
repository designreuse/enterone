package com.yedam.fandemic.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	@RequestMapping(value = "/notice") //주소
	public ModelAndView notice(HttpServletResponse response) throws IOException {
		return new ModelAndView("notice/notice_list");
	
	}	
	
	@RequestMapping(value = "/one") //주소
	public ModelAndView one(HttpServletResponse response) throws IOException {
		return new ModelAndView("notice/one_list");
	
	}	

}
