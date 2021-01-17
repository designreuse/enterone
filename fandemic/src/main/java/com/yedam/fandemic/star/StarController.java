package com.yedam.fandemic.star;

import java.io.IOException;
import java.util.List;

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

import com.yedam.fandemic.service.FboardService;
import com.yedam.fandemic.service.SboardService;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Sboard;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

@Controller
public class StarController {
	@Autowired
	StarService starService;
	@Autowired 
	StarServiceD starServiceD; 
	@Autowired
	SboardService sboardService;
	@Autowired
	FboardService fboardService;
	
	//스타 메인페이지
	@RequestMapping(value = "/star/{id}")
	public ModelAndView starMain(@PathVariable String id, Star stVo, Fan fVo, Company comVo, Sboard sbVo, Fboard fbVo, HttpSession session, ModelAndView mav) throws IOException {
		//채널 가입여부 확인
		Member member = (Member) session.getAttribute("member");
		if(member != null) {//로그인 안하면 채널가입 조회 불가
			fVo.setMem_id(member.getMem_id());
			fVo.setSt_id(id);
			mav.addObject("fan", starService.getFanInfo(fVo));
		}
		//스타정보 출력
		stVo.setSt_id(id);
		stVo = starService.getStarMain(stVo);
		System.out.println(stVo);
		mav.addObject("stVo", stVo);
		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		
		//통계치 출력
		mav.addObject("countFan", starService.getCountFan(stVo));
		mav.addObject("countFboard", starService.getCountFboard(stVo));
		mav.addObject("countReply", starService.getCountReply(stVo));
		mav.addObject("countSboard", starService.getCountSboard(stVo));
		
		sbVo.setSt_id(id);
		mav.addObject("sbVoNew", sboardService.getNewSboard(sbVo));
		fbVo.setSt_id(id);
		mav.addObject("fbVoList", fboardService.getFboardViewsList(fbVo));
		sbVo.setSt_id(id);
		mav.addObject("sbVoPicList", sboardService.getSboardPicList(sbVo));
		mav.setViewName("star/star_main");	
		return mav;
	}
	
	//채널 가입 등록
	@RequestMapping(value="/star/fanBoard/fanJoin", method=RequestMethod.POST)
	@ResponseBody
	public boolean fboardInsert(HttpServletRequest request, Fan fan,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    fan.setMem_id(member.getMem_id());
	    fan.setSt_id(request.getParameter("st_id"));
	    fan.setFan_name(request.getParameter("fan_name"));
	    
	    System.out.println(fan);
	    starService.insertFan(fan);
		return true;
	}
	
	//스타프로필 이동
	@RequestMapping(value = "/star/profile/{id}")
	public ModelAndView starProfile(@PathVariable String id, Company comVo, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		model.addAttribute("company", starService.getProfileCompany(comVo));
		
		return new ModelAndView("star/star_profile");
	}
	
	//스타스케줄 이동
	@RequestMapping(value = "/star/schedule/{id}")
	public ModelAndView starSchedule(@PathVariable String id, Company comVo, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		model.addAttribute("company", starService.getProfileCompany(comVo));
		return new ModelAndView("star/star_schedule");
	}

	//소속사 해당 스타 스케줄 리스트 불러오기
	@RequestMapping(value="/star/schedule/ScheduleList", method=RequestMethod.POST)
	@ResponseBody
	public List<Schedule> ScheduleList(HttpServletRequest request, Schedule schedule, Model model){
		System.out.println("id값 :"+schedule.getSt_id());
		
		return starServiceD.getStartList(schedule);
	}
	
	//스타라이브
	@RequestMapping(value = "/star/live/{id}")
	public ModelAndView starLive(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("stVo", starService.getStarMain(stVo));
		return new ModelAndView("star/star_live");
	}
	
	//스타게시판 이동
	@RequestMapping(value = "/star/starBoard/{id}")
	public ModelAndView starBoard(@PathVariable String id, HttpServletRequest request, Sboard sboVo, Company comVo, Star stVo, ModelAndView mav) throws IOException {

		stVo.setSt_id(id);
		mav.addObject("stVo", starService.getStarMain(stVo));
		
		sboVo.setSt_id(id);
		String strp = request.getParameter("p");
		int p = 1;
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(5); // 한페이지에 15건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		sboVo.setSbo_first(paging.getFirst());
		sboVo.setSbo_last(paging.getLast());
		
		paging.setTotalRecord(sboardService.getSboardCount(sboVo));
		
		System.out.println(paging);
		
		mav.addObject("paging", paging);

		mav.addObject("sboard", sboardService.getSboardList(sboVo));
		
		
		
		
		
		
		
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		mav.addObject("sbolist", sboardService.getSboardList(sboVo));
		mav.setViewName("star/star_board");
		return mav;
	}
	
	//팬게시판 이동
	@RequestMapping(value = "/star/fanBoard/{id}")
	public ModelAndView starFanBoard(@PathVariable String id, Star stVo, Company comVo, ModelAndView mav) throws IOException {
		
		stVo.setSt_id(id);
		mav.addObject("stVo", starService.getStarMain(stVo));
		
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		mav.addObject("company", starService.getProfileCompany(comVo));
		
		mav.setViewName("star/star_fan_board");
		return mav;
	}
	
	//사진게시판 이동
	@RequestMapping(value = "/star/album/{id}")
	public ModelAndView starAlbum(@PathVariable String id, Star stVo, Company comVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("stVo", starService.getStarMain(stVo));
		stVo = starService.getStarMain(stVo);
		comVo.setCom_id(stVo.getCom_id());
		model.addAttribute("company", starService.getProfileCompany(comVo));
		return new ModelAndView("star/star_album");
	}
	
}
