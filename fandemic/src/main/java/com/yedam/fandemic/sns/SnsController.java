package com.yedam.fandemic.sns;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SnsController {
	@RequestMapping(value = "/sns")
	public ModelAndView sns(HttpServletResponse response) throws IOException {
		return new ModelAndView("sns");
	}
}
