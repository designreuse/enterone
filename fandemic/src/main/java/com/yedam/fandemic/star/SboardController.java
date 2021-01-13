package com.yedam.fandemic.star;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.service.SboardService;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Sboard;
import com.yedam.fandemic.vo.Star;

@Controller
public class SboardController {
	@Autowired
	StarService starService;
	@Autowired
	SboardService sboardService;

	// 스타 글등록 페이지 이동
	@RequestMapping("/star/starBoard/insertView")
	public ModelAndView starBoardInsertView(HttpSession session, Company comVo, Star stVo, ModelAndView mav) throws IOException {
		Star star = (Star) session.getAttribute("star");
		String id = star.getSt_id();

		stVo.setSt_id(id);
		mav.addObject("star", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);

		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));

		mav.setViewName("star/star_board_insert");

		return mav;
	}

	// 스타가 글 등록
	@RequestMapping(value = "/star/starBoard/insert", method = RequestMethod.POST)
	@ResponseBody
	public boolean starBoardView(HttpServletRequest request, Sboard sboard, HttpSession session) throws IOException {
		Star star = (Star) session.getAttribute("star");
		sboard.setSt_id(star.getSt_id());
		sboardService.insertSboard(sboard);
		return true;
	}
}
