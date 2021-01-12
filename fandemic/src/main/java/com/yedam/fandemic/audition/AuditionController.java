package com.yedam.fandemic.audition;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Activity;

import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Trainee;

@Controller
public class AuditionController {
	@Autowired AuditionService auditionservice;
	@Autowired
	AuditionMapper auditionMapper;

	// 오디션 지원
	@RequestMapping(value = "/audition/auditionapply") // 주소
	public ModelAndView auditioninsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/audition_apply");

	}

	// 연습생 프로필
	@RequestMapping(value = "/audition/auditionprofile") // 주소
	public ModelAndView auditionprofile(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_profile");

	}

	// 연습생 등록 페이지
	@RequestMapping(value = "/audition/traineeinsert") // 주소
	public ModelAndView traineeinsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_insert");

	}

	// 연습생 등록
	@RequestMapping(value = "/audition/traineeinsertsend")
	public String traineeinsertsend(Model model, Trainee trainee) throws IOException {

		auditionMapper.inserttr(trainee);

		return "audition/trainee_list";
	}

	// 닉네임인 중복확인
	@RequestMapping(value = "/audition/nickCheck")
	@ResponseBody
	public int nickId(Model model, Trainee trainee) throws IOException {

		System.out.println("닉네임 중복확인");
		return auditionMapper.nickCheck(trainee);

	}

	// 연습생 활동 페이지
	@RequestMapping(value = "/audition/auditionwork") // 주소
	public ModelAndView auditionwork(Model model, HttpServletRequest request, Activity activity) throws IOException {
		model.addAttribute("TrworkList", auditionMapper.selectActivity());
		
		return new ModelAndView("audition/trainee_list");

	}

//연습생 활동 글등록 페이지 
	@RequestMapping(value = "/audition/activityinsert")
	public ModelAndView activityinsert(Model model, Activity activity, HttpSession session) throws IOException {
		return new ModelAndView("audition/activity_insert");
	}
	
	 //연습생 활동 글 등록
	@RequestMapping(value = "/audition/activityinsertsend")
	public String Insertac(HttpServletRequest request,Model model, Activity activity) throws IllegalStateException, IOException {		
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile="";
	   // 이미지파일, 공지사항 첨부파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/audition");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         activity.setAc_file(sumFile);
		      }else {
		    	  activity.setAc_file("");
		      }
	      }

	      auditionservice.insertac(activity); 
	      System.out.println("====="+activity.getAc_content());
	      model.addAttribute("msg","등록됐습니다.");
		return "redirect:/audition/auditionwork";
		
	}

}
