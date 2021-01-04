package com.yedam.fandemic.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.yedam.fandemic.config.MvcConfiguration;
import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.service.MailService;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

@Controller
public class LoginController {
	@Autowired MemberMapper memMapper;
	@Autowired MailService mailservice;
	

	@RequestMapping("/no-tiles/find") // id,pw 찾기 팝업창
	public ModelAndView findIdPw() throws IOException{

		return new ModelAndView("no-tiles/find");
	}
	
	// 개인 id 찾기
	@RequestMapping("/memIdFind")
	@ResponseBody
	public String memIdFind(HttpServletRequest request, Model model, Member member) throws IOException{
			
			member.setMem_name(request.getParameter("mem_name"));
			member.setMem_email(request.getParameter("mem_email"));
			
			member = memMapper.memIdFind(member);
			
			if ( member != null) {
				return member.getMem_id(); //아이디만 넘김
			} else {
				return null;
			}
			
			
			
	}
	
	// 기업 id찾기
	@RequestMapping("/comIdFind")
	@ResponseBody
	public String comIdFind(HttpServletRequest request, Model model, Company company) throws IOException{
		
		company.setCom_name(request.getParameter("com_name"));
		company.setCom_email(request.getParameter("com_email"));

		company = memMapper.comIdFind(company);
		
		if ( company != null) {
			return company.getCom_id();
		} else {
			return null;
		}
			
			
	}
	// 개인 pw
	@RequestMapping("/memPwFind")
	@ResponseBody
	public String memPwFind(@ModelAttribute Mail mail, HttpServletRequest request, Model model, Member member) throws IOException{
			
		member.setMem_id(request.getParameter("mem_id"));
		member.setMem_email(request.getParameter("mem_email"));
		member = memMapper.memPwFind(member);
		
		if(member != null) {
			
			
			
			mail.setSenderName("엔터원");
			mail.setSenderMail("haez119@gmail.com");
			mail.setReceiveMail(member.getMem_email());
			mail.setSubject("요청하신 비밀번호입니다.");
			mail.setMessage(member.getMem_id() + " 님의 비밀번호는 " + member.getMem_pw() + " 입니다.");
			
			try {
				mailservice.sendEmail(mail); 
				System.out.println("메일전송");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("메일실패");
	        }

			
			return member.getMem_email();
		} else {
			return null;
		}
			
			
	}
	
	// 기업 pw
	@RequestMapping("/comPwFind")
	@ResponseBody
	public String comPwFind(@ModelAttribute Mail mail, HttpServletRequest request, Model model, Company company) throws IOException{
			
		company.setCom_id(request.getParameter("com_id"));
		company.setCom_email(request.getParameter("com_email"));
		company = memMapper.comPwFind(company);

		if(company != null) {
			
			
			
			mail.setSenderName("엔터원");
			mail.setSenderMail("haez119@gmail.com");
			mail.setReceiveMail(company.getCom_email());
			mail.setSubject("요청하신 비밀번호입니다.");
			mail.setMessage(company.getCom_id() + " 님의 비밀번호는 " + company.getCom_pw() + " 입니다.");
			
			try {
				mailservice.sendEmail(mail); 
				System.out.println("메일전송");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("메일실패");
	        }
			
			
			return company.getCom_email();
		} else {
			return null;
		}
			
	}
	
	@RequestMapping("/logout") 
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("로그아웃");
		
		session.invalidate();
		
		request.setAttribute("login", null);
		
		return new ModelAndView("login");
	}
	    
	// 개인 로그인
	@RequestMapping(value="/memberLogin")
	public String memberLogin(HttpServletRequest request,HttpSession session,  Model model, Member member) throws IOException{
		
		member = memMapper.memLogin(member);
		
		if ( member != null) {
			
			session.setAttribute("member", member);
			
			return "redirect:index";
			
		} else {   
			
			request.setAttribute("login", "fail");
			
			return "login";
		}
		
	} // 개인 로그인
	
	
	//소속사
	@RequestMapping(value="/companyLogin")
	public String companyLogin(Model model, Company company, HttpSession session) {
		
		company = memMapper.comLogin(company); //id와 pw를 받아서 값이 있는지 DB조회
		
		// 아이디가 있을 때
		if ( company != null) {
			
			// 일반기업(소속사) 일 때
			System.out.println("권한: " + company.getCom_class());
			

			if (company.getCom_class().equals("1")) {
				session.setAttribute("company", company);
				
				return "redirect:management"; 
				
			} else { // admin 일 때
				session.setAttribute("company", company);
				
				return "redirect:adminMain";
			}
		//아이디가 DB에없을때
		} else {
			model.addAttribute("login", "fail");
			return "login";
		}
		
		
	}// 소속사 로그인
	
	
	@RequestMapping(value="/starLogin")
	public String starLogin(HttpServletRequest request, Model model, Star star,  HttpSession session) throws IOException{
		System.out.println("스타로그인");
		
		star.setSt_id(request.getParameter("com_id"));
		star.setSt_pw(request.getParameter("com_pw"));
		
		star = memMapper.starLogin(star);
		
		// 아이디가 있을 때
		if ( star != null) {
			
			session.setAttribute("star", star);
			return "redirect:starMain"; 
				
		} else {
			model.addAttribute("login", "fail");
			return "login";
		}
	}

	
	// 회원가입 페이지
	@RequestMapping("/register")
	public ModelAndView register(Model model, Member member, Company company) throws IOException{

		return new ModelAndView("login/register");
	}
	
	// 개인 중복확인
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(Model model, Member member) throws IOException{
		
			System.out.println("개인 중복확인");
			return memMapper.memIdCheck(member);
			
	}
	
	// 기업 중복확인
	@RequestMapping("/checkIdcom")
	@ResponseBody
	public int checkIdcom(Model model, Company company) throws IOException{

			System.out.println("기업 중복확인");
			return memMapper.comIdCheck(company);

	}
	
	// 개인 메일 중복 확인
	@RequestMapping("/memMail")
	@ResponseBody
	public int memMail(Model model, Member member) throws IOException{
		
			System.out.println("개인 메일");
			return memMapper.memMailCheck(member);
			
	}
	
	
	// 기업 메일 중복 확인
	@RequestMapping("/comMail")
	@ResponseBody
	public int comMail(Model model, Company company) throws IOException{
		
			System.out.println("기업 메일");
			return memMapper.comMailCheck(company);
			
	}
	
	
	// 개인 회원가입 처리
	@RequestMapping("/memRegister")
	public String memRegister(Model model,  Company company, Member member, Errors errors) throws IOException{
		
		new MemberValidator().validate(member, errors);
		
		if(errors.hasErrors()) {
			
			return "login/register";
		}
		
		memMapper.memInsert(member);
		model.addAttribute("login", "insert"); // 세션으로 바꿔야 함
		
		return "login";
	}
	
	
	
	// 기업 회원가입
	@RequestMapping("/comRegister")
	public String comRegister(Model model, Member member,  Company company, Errors errors) throws IOException{
		
		new CompanyValidator().validate(company, errors);
		model.addAttribute("tab", "tab-2");
		
		if(errors.hasErrors()) {
			
			return "login/register";
			
		}
		
		memMapper.comInsert(company);
		
		model.addAttribute("login", "insert");
		
		return "login";
	}
	

	// 카카오 로그인
	@RequestMapping(value="/kakaoLogin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra , HttpSession session, HttpServletResponse response, Member member, HttpServletRequest request, Model model) throws IOException{
		
		JsonNode accessToken;
		 
        // JsonNode트리형태로 토큰받아온다
        JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
        // 여러 json객체 중 access_token을 가져온다
        accessToken = jsonToken.get("access_token");
 
        System.out.println("access_token : " + accessToken);


     // access_token을 통해 사용자 정보 요청
        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
 
        // Get id
        String id = userInfo.path("id").asText();
        String name = null;
        String email = null;
        String gender = null;
 
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        name = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
        gender = kakao_account.path("gender").asText();
 
        

        member.setMem_id(id);

        member = memMapper.socialLogin(member);
		
		if ( member != null) {
			
			session.setAttribute("member", member);
			System.out.println(" > " + member.getMem_type());
			
			return "index";
			
		} else {   
			Member member2 = new Member();
			member2.setMem_id(id);
			member2.setMem_name(name);
			member2.setMem_email(email);
			member2.setMem_gender(gender);
	        // request.setAttribute("member", member2);
			
			model.addAttribute("member", member2);
			
	        return "login/social";
		}

	}
	
	// 카카오 회원가입
	@RequestMapping("/kakaoRegister")
	public String kakaoRegister(Model model, HttpSession session,  Member member) throws IOException{
		
		memMapper.socialInsert(member);
		session.setAttribute("member", member);
		
		System.out.println("insert " + member.getMem_id());
		
		return "index";  // 세션에 member 담고 바로 index로 가기
	}

}