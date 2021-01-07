package com.yedam.fandemic.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MainMapper;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Melon;
import com.yedam.fandemic.vo.Member;

@Controller
public class MainController {
	@Autowired
	MainMapper dao;

	@RequestMapping(value = "/")
	public ModelAndView Main(Model model) throws IOException {

		return new ModelAndView("redirect:index");
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(Model model, Goods goods, HttpSession session, HttpServletRequest request ) throws Exception {
		
		// 행사리스트
		model.addAttribute("goods", dao.ticketList()); 
		
		// 멜론
		ArrayList<Melon> list = new ArrayList<Melon>();
		MelonCrawling mc = new MelonCrawling();
		list = mc.melonTop();
		model.addAttribute("melon", list);
		
		//영화
		ArrayList<HashMap<String, String>> movie = new ArrayList<HashMap<String,String>>();
		MovieAPI api = new MovieAPI();
		movie = api.requestAPI();
		model.addAttribute("movie", movie);
		
		
		// 시청률
		ArrayList<HashMap<String, String>> rating = new ArrayList<HashMap<String,String>>();
		TVCrawling tc = new TVCrawling();
		rating = tc.TvRating();
		model.addAttribute("rating", rating);
		
		// 팬 수 (차트)
		List<HashMap<String, Object>> stCnt = new ArrayList<HashMap<String, Object>>();
		stCnt = dao.fanCount();
		model.addAttribute("stCnt", stCnt);
		

		return new ModelAndView("index");
	}
	

	@RequestMapping("/myStar3")
	@ResponseBody
	public List<HashMap<String, Object>> myStar3(HttpServletRequest request) {
		
		List<HashMap<String, Object>> myStar3 = new ArrayList<HashMap<String, Object>>();
		String id = request.getParameter("mem_id");
		myStar3 = dao.myStar3(id);
		
		// 게시글 등록을 1개도 안했으면 
		if (myStar3.isEmpty()) {
			myStar3 = dao.myStarList(id); // 새로 조회해서 덮어써서
			return myStar3; //반환
		} else {
			return myStar3; // 1개라도 등록했으면 바로 리턴
		}

	}

}
