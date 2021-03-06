package com.yedam.fandemic.aboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Goods;

@Controller
public class AboardController {
	@Autowired
	AuditionMapper auditionMapper;
	@Autowired
	AuditionService auditionservice;
	
	//오디션 공고
	@RequestMapping(value="/audition/auditionlist")
	public ModelAndView auditionlist(Model model, Aboard aboard) throws IOException{
		model.addAttribute("auditionList", auditionMapper.auditionlist());
		return new ModelAndView("audition/audition_list2");
	}
	

	// 게시물 목록 출력
	@RequestMapping(value = "/auditionAboard/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Aboard> aboardList(HttpServletRequest request, Aboard aboard) {
		return auditionservice.auditionlist();
	}
	//게시물 상세보기 주소
	@RequestMapping(value = "/auditionlistDetail/{no}", method = RequestMethod.GET)
	public ModelAndView auditionlistDetail(@PathVariable String no, Aboard aboard, Model model) throws IOException {
		// 단건
		aboard.setAbo_no(no);
		
		model.addAttribute("no",auditionMapper.insertselect(aboard));

		model.addAttribute(auditionMapper.getAboardInfo(aboard));
		return new ModelAndView("audition/audtion_detail");
	}
	
	
	
}