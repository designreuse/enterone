package com.yedam.fandemic.audition;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.TraineeMapper;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Trainee;


@Controller
public class AuditionController {
	
	@Autowired TraineeMapper traineeMapper;
	
//연습생 활동
	@RequestMapping(value = "/auditionwork") //주소
	public ModelAndView auditionwork(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_list");
	
	}	
	
	@RequestMapping(value = "/auditionwork2") //주소
	public ModelAndView auditionwork2(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_list2");
	
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
