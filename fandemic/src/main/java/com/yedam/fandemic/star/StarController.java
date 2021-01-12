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

import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.service.impl.StarServiceImplD;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

@Controller
public class StarController {
	@Autowired
	StarService starService;
	@Autowired 
	StarServiceD starServiceD; 
	
	//스타 메인페이지
	@RequestMapping(value = "/star/{id}")
	public ModelAndView starMain(@PathVariable String id, Star stVo, Fan fan, HttpSession session, Model model) throws IOException {
		//채널 가입여부 확인
		Member member = (Member) session.getAttribute("member");
		if(member != null) {//로그인 안하면 채널가입 조회 불가
			fan.setMem_id(member.getMem_id());
			fan.setSt_id(id);
			model.addAttribute("fan", starService.getFanInfo(fan));
		}
		//스타정보 출력
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));	
		return new ModelAndView("star/star_main");
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
	
	//스타스케줄 이동
	@RequestMapping(value = "/star/schedule/{id}")
	public ModelAndView starSchedule(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_schedule");
	}
	
	//소속사 해당 스타 스케줄 리스트 불러오기
	@RequestMapping(value="/star/schedule/ScheduleList", method=RequestMethod.POST)
	@ResponseBody
	public List<Schedule> ScheduleList(HttpServletRequest request, Schedule schedule, Model model){
		System.out.println("id값 :"+schedule.getSt_id());
		
		return starServiceD.getStartList(schedule);
	}
	
	
	@RequestMapping(value = "/star/live/{id}")
	public ModelAndView starLive(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_live");
	}
	
	//스타게시판 이동
	@RequestMapping(value = "/star/board/{id}")
	public ModelAndView starBoard(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_board");
	}
	
	//팬게시판 이동
	@RequestMapping(value = "/star/fanBoard/{id}")
	public ModelAndView starFanBoard(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_fan_board");
	}
	
	//사진게시판 이동
	@RequestMapping(value = "/star/album/{id}")
	public ModelAndView starAlbum(@PathVariable String id, Star stVo, Model model) throws IOException {
		stVo.setSt_id(id);
		model.addAttribute("star", starService.getStarMain(stVo));
		return new ModelAndView("star/star_album");
	}
	
}
