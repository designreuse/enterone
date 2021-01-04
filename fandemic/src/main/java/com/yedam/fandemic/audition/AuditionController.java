package com.yedam.fandemic.audition;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.TraineeMapper;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Trainee;

@Controller
public class AuditionController {
	
	@Autowired TraineeMapper traineeMapper;
	

	@RequestMapping(value = "/auditionwork") //주소
	public ModelAndView auditionwork(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_list");
	
	}	
	
	@RequestMapping(value = "/auditionapply") //주소
	public ModelAndView auditioninsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/audition_apply");
	
	}	
	
	@RequestMapping(value = "/auditionprofile") //주소
	public ModelAndView auditionprofile(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_profile");
	
	}	
	
	@RequestMapping(value = "/traineeinsert") //주소
	public ModelAndView traineeinsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_insert");
	
	}	
	
	//닉네임인 중복확인
	
		@RequestMapping("/nickId")
		@ResponseBody
		public int nickId(Model model, Trainee trainee) throws IOException{
			
				System.out.println("닉네임 중복확인");
				return traineeMapper.nickCheck(trainee);
				
		}
	
}
