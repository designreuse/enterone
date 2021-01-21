package com.yedam.fandemic.main;

import java.io.File;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MainMapper;
import com.yedam.fandemic.impl.SnsMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Melon;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Sns;
import com.yedam.fandemic.vo.Star;

@Controller
public class MainController {
	@Autowired MainMapper dao;

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
		ArrayList<HashMap<String, String>> rating = new
		ArrayList<HashMap<String,String>>(); TVCrawling tc = new TVCrawling(); 
		rating = tc.TvRating(); model.addAttribute("rating", rating);
		 
		
		// 팬 수 (차트)
		List<HashMap<String, Object>> stCnt = new ArrayList<HashMap<String, Object>>();
		stCnt = dao.fanCount();
		model.addAttribute("stCnt", stCnt);
		
		
		//sns
		List<Sns> snsList = new ArrayList<Sns>();
		snsList = dao.todaySns();
		
		if ( snsList.size() != 0) {
			String maxSnsNo = snsList.get(0).getSns_no();
			model.addAttribute("maxSnsNo", maxSnsNo); // 이후 등록된 건 조회를 위해 no max값 저장
			model.addAttribute("snsList", snsList);
		}

		return new ModelAndView("index");
	}
	

	@RequestMapping("/myStar3")
	@ResponseBody
	public List<HashMap<String, Object>> myStar3(HttpServletRequest request) {
		
		List<HashMap<String, Object>> myStar3 = new ArrayList<HashMap<String, Object>>();
		String id = request.getParameter("mem_id");
		
		myStar3 = dao.myStar3(id); // 게시글 갯수로 스타3 가져옴
		
		// 게시글 등록을 3개 보다 작으면 
		if (myStar3.size() < 3) {
			myStar3 = dao.myStarList(id); // 새로 조회해서 덮어써서
			
			if (myStar3.size() == 0) { // 이것도 null이면
				return null; //널
			} else {
				return myStar3; //반환
			}
			
		} else {
			return myStar3; // 게시글 등록 스타가 3개 이상이면
		}

	}
	
	//스크롤 내릴 때마다 select 다시
	
	@RequestMapping("/newSns")
	@ResponseBody
	public List<Sns> newSns(HttpServletRequest request) {
		
		List<Sns> newSns = new ArrayList<Sns>();
		String maxSnsNo = request.getParameter("maxSnsNo");
		newSns = dao.newSns(maxSnsNo);
		
		return newSns;
		

	}
	
	@RequestMapping("/search")   
	public ModelAndView search(Model model, HttpServletRequest request) {
		
		String keyword = request.getParameter("keyword");
		if (keyword == null || keyword == "") {
			
			return new ModelAndView("search");
			
		} else {
		

		List<Company> com = dao.searchCom(keyword);
		List<Star> st = dao.searchStar(keyword);
		List<HashMap<String,Object>> ac = dao.searchAc(keyword);
		
		
		if(com.size() != 0) {
			model.addAttribute("company", com);		
		} 
		
		if (st.size() != 0) {
			model.addAttribute("star", st);
		}
		
		if(ac.size() != 0) {
			model.addAttribute("activity", ac);
		}
       
		return new ModelAndView("search");
		}
	}
	
	@PostMapping("/proUpdate")   
	public String proUpdate(Model model, HttpServletRequest request, Member member, HttpSession session) throws IllegalStateException, IOException {
		
		
		member = (Member)session.getAttribute("member");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request; // request 를 multipart로 캐스팅
		MultipartFile multipartFile = multipartRequest.getFile("profile");
		
		if(! multipartFile.isEmpty() && multipartFile.getSize() > 0) { // 임시폴더에 업로드된 파일을 실제 폴더로 transfer 이동
			String path = request.getSession().getServletContext().getRealPath("/images/member_pic");
			System.out.println("====path : " + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); 
			member.setMem_pic(multipartFile.getOriginalFilename());
		}
		
		// 프로필 업데이트 dao
		dao.mainUpdate(member);
		
		return "redirect:index";
		
	}
	
	
	
}
