package com.yedam.fandemic.untact;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.fandemic.impl.UntactMapper;
import com.yedam.fandemic.vo.Untact;

@Controller
public class UntactController {
	
	@Autowired UntactMapper dao;
	
	@RequestMapping(value = "/untact")
	public ModelAndView test(Model model, HttpServletRequest request) throws IOException {

		// all 리스트
		model.addAttribute("unList", dao.untactList());
		//커밍순 리스트
		List<Map<String, Object>> list = dao.comingsoonList();
		model.addAttribute("comingList", list);
		model.addAttribute("cnt", list.size());
		
		return new ModelAndView("untact/untact");
	}
	
	@ResponseBody
	@RequestMapping(value = "/untactCode")
	public String untactCode(HttpServletRequest request, RedirectAttributes redirect) throws IOException {
		
		String code = request.getParameter("code");
		
		String getCode = dao.getUntactCode(request.getParameter("go_no"));
		
		System.out.println("===============입력한 코드 : " + code + " db코드 : " + getCode);

		if (code.equals(getCode)) {
			return "same";			
		} else {
			return null;
		}
	}
	

	
	@RequestMapping(value = "/starUntact")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/starUntact");
	}
	
	@RequestMapping(value = "/unDetail")
	public ModelAndView unDetail(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/unDetail");
	}
	
	@RequestMapping(value = "/no-tiles/untactCode")
	public ModelAndView untactCode(Model model, HttpServletRequest request) throws IOException {
		
		String no = request.getParameter("go_no");
		System.out.println("왜 안되니" + no + "널이야?? 왜??");
		model.addAttribute("go_no", no);
	
		return new ModelAndView("no-tiles/untactCode");
	}
	
}
