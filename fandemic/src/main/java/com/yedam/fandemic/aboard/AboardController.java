package com.yedam.fandemic.aboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.service.AboardService;
import com.yedam.fandemic.vo.Aboard;


@Controller
public class AboardController {
	@Autowired
	AuditionMapper auditionMapper;
		//오디션 목록
		@RequestMapping(value = "/audition/auditionlist") // 주소
		public ModelAndView auditionlist(HttpServletResponse response) throws IOException {
			return new ModelAndView("audition/audition_list");
		}
//		 //게시물 말머리 별 목록 출력
//		   @RequestMapping(value="/star/fanBoard/list/subject", method=RequestMethod.GET)
//		   @ResponseBody
//		   public List<Aboard> fboardSubjectList(HttpServletRequest request, Model model, Aboard fboard) {      
//		      return  AboardService.getFboardSubjectList(fboard);
//		   }
}
