package com.yedam.fandemic.star;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.fandemic.impl.AdminMapper;
import com.yedam.fandemic.service.SboardService;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Filter;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Sboard;
import com.yedam.fandemic.vo.Star;

@Controller
public class SboardController {
	@Autowired
	StarService starService;
	@Autowired
	SboardService sboardService;
	@Autowired 
	AdminMapper adminService;
	
	// 스타 글등록 페이지 이동
	@RequestMapping("/star/starBoard/insertView")
	public ModelAndView starBoardInsertView(HttpSession session, Company comVo, Star stVo, ModelAndView mav)
			throws IOException {
		Star star = (Star) session.getAttribute("star");
		String id = star.getSt_id();
		
		stVo.setSt_id(id);
		mav.addObject("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);

		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		
		List<Filter> list = new ArrayList<Filter>();
		list = adminService.filBoard();
		Gson gson = new GsonBuilder().create();
		String filList = gson.toJson(list);
		mav.addObject("filList", filList);
		
		mav.setViewName("star/star_board_insert");
		return mav;
	}

	// 스타 게시물 단건 조회, 페이지 이동
	@RequestMapping("/star/starBoard/view/{no}")
	public ModelAndView starBoardView(@PathVariable String no, HttpSession session, 
			Sboard sboVo, Company comVo, Star stVo, ModelAndView mav) throws IOException {
		Star star = (Star) session.getAttribute("star");
		if(star != null) {
			mav.addObject("st_id", star.getSt_id());			
		}
		
		sboVo.setSbo_no(no);
		mav.addObject("sboard", sboardService.getSboardInfo(sboVo));
		sboVo = sboardService.getSboardInfo(sboVo);
		System.out.println(sboVo);	
		
		stVo.setSt_id(sboVo.getSt_id());
		mav.addObject("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		
		List<Filter> list = new ArrayList<Filter>();
		list = adminService.filBoard();
		Gson gson = new GsonBuilder().create();
		String filList = gson.toJson(list);
		mav.addObject("filList", filList);
		
		mav.setViewName("star/star_board_view");
		return mav;
	}

	// 게시물 상세보기 데이터 불러오기 액션
	@RequestMapping(value = "/star/starBoard/read/", method = RequestMethod.GET)
	@ResponseBody
	public Sboard starBoardViewAction(HttpServletRequest request, Sboard sboVo, Model model) throws IOException {
		sboVo.setSbo_no(request.getParameter("sbo_no"));
		sboVo = sboardService.getSboardInfo(sboVo);
		// 해시태그 #찾아서 배열로 담기
		if (sboVo.getSbo_hashtag() != null) {
			String test4 = sboVo.getSbo_hashtag();
			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
			Matcher m = p.matcher(test4);
			String extractHashTag = null;

			int i = 0;
			ArrayList<String> hashtag_array = new ArrayList<>();
			while (m.find()) {
				extractHashTag = m.group();
				if (extractHashTag != null) {
					hashtag_array.add(extractHashTag);
				}
			}
			sboVo.setSbo_hashtag_array(hashtag_array);
		}

		return sboVo;
	}
	
	// 수정을 위한 게시물 내용출력
	@RequestMapping("/star/starBoard/updateView/{no}")
	public ModelAndView starBoardUpdateViewAction(@PathVariable String no, HttpSession session, Sboard sboVo, Company comVo, Star stVo, ModelAndView mav) throws IOException {

		Star star = (Star) session.getAttribute("star");
		String id = star.getSt_id();
		
		stVo.setSt_id(id);
		mav.addObject("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);

		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		mav.addObject("no", no);
		
		List<Filter> list = new ArrayList<Filter>();
		list = adminService.filBoard();
		Gson gson = new GsonBuilder().create();
		String filList = gson.toJson(list);
		mav.addObject("filList", filList);
		
		mav.setViewName("star/star_board_update");
		
		return mav;
	}

	
	
	
	
	// 스타가 글 등록
	@RequestMapping(value = "/star/starBoard/insert", method = RequestMethod.POST)
	@ResponseBody
	public boolean starBoardInsert(HttpServletRequest request, Sboard sboVo, HttpSession session) throws IOException {
		Star star = (Star) session.getAttribute("star");
		sboVo.setSt_id(star.getSt_id());
		sboardService.insertSboard(sboVo);
		return true;
	}
	
	//수정
   @RequestMapping(value="/star/starBoard/update", method=RequestMethod.POST)
   @ResponseBody
   public boolean starBoardUpdate(HttpServletRequest request, Sboard sboVo) throws IOException {
	  sboardService.updateSboard(sboVo);
	  return true;
   }
	   
	//삭제
   @RequestMapping(value="/star/starBoard/delete/", method=RequestMethod.POST)
   @ResponseBody
   public boolean starBoardDelete(HttpServletRequest request, Sboard sboVo) throws IOException {
      sboardService.deleteSboard(sboVo);
      return true;
   }
}
