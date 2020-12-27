package com.yedam.fandemic.sns;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.SnsMapper;
import com.yedam.fandemic.vo.Cnotice;
import com.yedam.fandemic.vo.Sns;
@Controller
public class SnsController {
	@Autowired
	SnsMapper snsdao;
	
	
	
	@RequestMapping(value = "/sns")
	public ModelAndView sns(HttpServletResponse response) throws IOException {
		return new ModelAndView("sns/sns");
	}
	// SNS 등록
	@RequestMapping(value = "/sns/snsInsert")
	public String noticesInsert(Sns sns) {
		snsdao.insertSns(sns);
		return "sns/sns";
	}
}
