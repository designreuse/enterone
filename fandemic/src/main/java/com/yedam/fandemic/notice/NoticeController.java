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
	
	@RequestMapping(value = "/question") //주소
	public ModelAndView question(HttpServletResponse response) throws IOException {
		return new ModelAndView("notice/question_list");
	
	}	
	@RequestMapping(value = "/questioninsert") //주소
	public ModelAndView questioninsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("notice/question_insert");
	
	}	

}
