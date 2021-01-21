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
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Untact;

@Controller
public class UntactController {
	
	@Autowired UntactMapper dao;
	
	@RequestMapping(value = "/untact")
	public ModelAndView test(Model model, HttpServletRequest request, Untact untact) throws IOException {
		
		
		String strp = request.getParameter("p");
		int p = 1;
		          
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		
		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		untact.setU_first(paging.getFirst());
		untact.setU_last(paging.getLast());
		
		paging.setTotalRecord(dao.unCnt());
		
		model.addAttribute("paging",paging);
		model.addAttribute("unList", dao.untactList(untact));
		
		//커밍순 리스트
		List<Map<String, Object>> list = dao.comingsoonList();
		model.addAttribute("comingList", list);
		model.addAttribute("cnt", list.size());
		
		return new ModelAndView("untact/untact");
	}
	


	
	@RequestMapping(value = "/starUntact")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/starUntact");
	}
	
	@RequestMapping(value = "/unDetail")
	public ModelAndView unDetail(HttpServletResponse response) throws IOException {
		return new ModelAndView("untact/unDetail");
	}

	
}
