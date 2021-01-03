package com.yedam.fandemic.mypage;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MypageMapper;
import com.yedam.fandemic.login.MemberValidator;
import com.yedam.fandemic.vo.Member;

@Controller
public class MypageController {
	
	@Autowired MypageMapper myMapper;
	
	
	
	//mypage메인
		@RequestMapping(value = "/mypagemain")
		public ModelAndView mymain(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_main");
}
		//mypage메인
		@RequestMapping(value = "/newmail")
		public ModelAndView newmail(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_mail_new");}
		
		
		
		//my정보 수정 update처리

		
		@RequestMapping(value = "/myupdate")
		public String  myupdate(Model model, Member member, Errors errors, HttpServletResponse response) throws IOException {
			new MemberValidator().validate(member, errors);
			
			if(errors.hasErrors() ) {
				return "mypage/my_update";
			}
			
			myMapper.memUpdate(member);
			model.addAttribute("memUpdate", "update");
			return "myupdate";
			
			
			
			
			
			
			
}
		//my스타 메인
		@RequestMapping(value = "/mystar")
		public ModelAndView mystar(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_star");
}
		//my연습생 메인
		@RequestMapping(value = "/mytrainee")
		public ModelAndView mytrainee(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_trainee_update");
}
		//my결제내역
		@RequestMapping(value = "/mypurchase")
		public ModelAndView mypurchase(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_purchase_history");
}
		//my이벤트
		@RequestMapping(value = "/myevent")
		public ModelAndView myevent(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_event");
}
		//my쪽지함관리
		@RequestMapping(value = "/mymail")
		public ModelAndView mymail(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_mail");
}
		//my1:1main
		@RequestMapping(value = "/my1o1")
		public ModelAndView my1o1(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_1o1");
}
		//my1:1ask
		@RequestMapping(value = "/my1o1ask")
		public ModelAndView my1o1ask(HttpServletResponse response) throws IOException {
			return new ModelAndView("mypage/my_1o1_ask");
		}
}