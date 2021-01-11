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

import com.yedam.fandemic.impl.TraineeMapper;
import com.yedam.fandemic.service.AboardService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Reply;
import com.yedam.fandemic.vo.Trainee;


@Controller
public class AuditionController {
	//@Autowired TraineeService traineeservice;
	@Autowired TraineeMapper traineeMapper;
	
//연습생 활동
//	@RequestMapping(value = "/auditionwork")
//	@ResponseBody //결과값 JSON
//	public List<Activity> selectActivity(Activity activity){
//		return traineeservice.selectActivity(activity);
//	}	
	
	//연습생 활동 페이지
		@RequestMapping(value = "/auditionwork") //주소
		public ModelAndView traineeactivity(Model model, HttpServletRequest request, Activity activity) throws IOException {
			model.addAttribute("TrworkList", traineeMapper.selectActivity());
			
			return new ModelAndView("audition/trainee_list");
		
		}	
	
		
	
	//오디션 지원
	@RequestMapping(value = "/auditionapply") //주소
	public ModelAndView auditioninsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/audition_apply");
	
	}	
	//연습생 프로필
	@RequestMapping(value = "/auditionprofile") //주소
	public ModelAndView auditionprofile(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_profile");
	
	}	
	//연습생 등록 페이지
	@RequestMapping(value = "/traineeinsert") //주소
	public ModelAndView traineeinsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_insert");
	
	}	
	//연습생 등록
	@RequestMapping(value ="/traineeinsertsend")
	public String traineeinsertsend(Model model, Trainee trainee) throws IOException {
		
		traineeMapper.inserttr(trainee);

		return  "audition/trainee_list";	
	}	
	
//연습생 활동 글등록 페이지 
	@RequestMapping(value = "/traineewritere")
	public ModelAndView traineewritere(Model model, Activity activity, HttpSession session) throws IOException {
		Member member = (Member) session.getAttribute("member");
		

		return new ModelAndView("audition/trainee_write");
	}
	
//	 @RequestMapping(value="/star/fanBoard/reply", method=RequestMethod.POST)
//	   @ResponseBody
//	   public boolean fboardInsert(HttpServletRequest request, Reply reply,  HttpSession session) throws IOException {
//	       Member member = (Member) session.getAttribute("member");
//	       reply.setMem_id(member.getMem_id());
//	       
//	       replyService.insertReply(reply);
//	      return true;
//	   }
	
	
	
	
	
	
	//닉네임인 중복확인	
		@RequestMapping(value="/audition/nickCheck")
		@ResponseBody
		public int nickId(Model model, Trainee trainee) throws IOException{
			
				System.out.println("닉네임 중복확인");
				return traineeMapper.nickCheck(trainee);
				
		}
		
//		@PostMapping("/traineefile")
//		public String userInsert(HttpServletRequest request, Trainee trainee) throws IllegalStateException,
//		IOException {
//			// request를 multipart로 캐스팅
//			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//			// 이미지파일
//			MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
//			// 첨부파일
//			if (!multipartFile.isEmpty() && multipartFile.getSize()>0) { //이미지가 있다면
//				String path = request.getSession().getServletContext().getRealPath("/images/trimage");
//				System.out.println("path=" + path);
//				multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
//				//트랜스퍼 이동시켜주는거 
//				trainee.setTr_pic(multipartFile.getOriginalFilename());
//				
//			}
//			traineeMapper.inserttr(trainee);
//			return "audition/trainee_list";
//		}
}
