package com.yedam.fandemic.login;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.vo.Member;

@Controller
public class KakaoLoginController {
	
	@Autowired MemberMapper memMapper;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(); /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		
		String kakaoUrl = KakaoAPI.getAuthorizationUrl(); /* 생성한 인증 URL을 View로 전달 */
		
		model.addAttribute("login",request.getParameter("login"));
		mav.setViewName("login"); // 카카오 로그인
		
		// mav.addObject("naver_url", naverAuthUrl); 
		mav.addObject("kakao_url", kakaoUrl);
		return mav;
	}

	@RequestMapping(value = "/kakaoLogin", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Member member, Model model) throws Exception {
		
		
		JsonNode node = KakaoAPI.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = KakaoAPI.getKakaoUserInfo(accessToken);
		JsonNode kakao_account = userInfo.path("kakao_account");
		JsonNode properties = userInfo.path("properties");
  
		String kid = userInfo.path("id").asText();
		String kimage = properties.path("profile_image").asText();
		
		member.setMem_id(kid);
		
		member = memMapper.socialLogin(member);
		
		if(member != null) {
			session.setAttribute("member", member);
			// 로그인 할 때마다 프사 업데이트

			return "redirect:index";
		} else {
			
			member = new Member();
			
			String kname = properties.path("nickname").asText();
			String kemail = kakao_account.path("email").asText();
			String kgender = kakao_account.path("gender").asText();
			
			member.setMem_id(kid);
			member.setMem_name(kname);
			member.setMem_email(kemail);
			member.setMem_gender(kgender);
			member.setMem_pic(kimage);
			
			model.addAttribute("member", member);
			
			return "login/social";
		}

	}
	
	
	
	
	// 카카오 회원가입
	@RequestMapping("/kakaoRegister")
	public String kakaoRegister(Model model, HttpSession session,  Member member, Errors errors) throws IOException{
		
		new SocialValidator().validate(member, errors);
		
		if(errors.hasErrors()) {
			return "login/social";
		}
		
		memMapper.socialInsert(member);
		member.setMem_type("0"); // 타입 따로 넣기
		
		session.setAttribute("member", member);

		return "redirect:index";  // 세션에 member 담고 바로 index로 가기
	}
	
	//구글 회원가입?
	
	@RequestMapping("/googleRegister")
	public String googleRegister(Model model, HttpSession session,  Member member) throws IOException{
		System.out.println("============구글 들어옴");
		
		return "redirect:index";  // 세션에 member 담고 바로 index로 가기
	}
	
	
	
	
}
