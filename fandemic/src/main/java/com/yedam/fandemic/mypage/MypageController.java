package com.yedam.fandemic.mypage;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MypageMapper;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.QnA;

@Controller
public class MypageController {

	@Autowired
	MypageMapper myMapper;

	// mypage메인
	@RequestMapping(value = "/mypagemain")
	public ModelAndView mymain(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_main");
	}

	// 쪽지 메인
	



	// my정보 수정 세션값 받아오기

	@RequestMapping(value = "/myupdate")
	public String myupdate(Model model, HttpServletResponse response) throws IOException {

		return "mypage/my_update";
	}

	// my정보 수정 update처리
	@RequestMapping(value = "/myupdate2")
	public String myupdate2(Model model, HttpServletResponse response, HttpServletRequest request, Member member,
			HttpSession session) throws IOException {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images/member_pic");

			System.out.println("path=" + path);

			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			member.setMem_pic(multipartFile.getOriginalFilename());
		}

		myMapper.memUpdate(member);
		session.setAttribute("member", member);
		return "mypage/my_update";

	}

	// my스타 메인
	@RequestMapping(value = "/mystar")
	public ModelAndView mystar(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_star");
	}

	// my연습생 메인
	@RequestMapping(value = "/mytrainee")
	public ModelAndView mytrainee(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_trainee_update");
	}

	// my결제내역
	@RequestMapping(value = "/mypurchase")
	public ModelAndView mypurchase(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_purchase_history");
	}

	// my이벤트
	@RequestMapping(value = "/myevent")
	public ModelAndView myevent(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_event");
	}

	
	
	
	// my쪽지함관리
	// 메인
	@RequestMapping(value = "/mymail")
	public String newmail(Model model, Letter letter, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		Member member = (Member) session.getAttribute("member");
		letter.setMem_id(member.getMem_id());
		String strp = request.getParameter("p");
		int p = 1;
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(15); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		letter.setLett_first(paging.getFirst());
		letter.setLett_last(paging.getLast());
		
		paging.setTotalRecord(myMapper.getletterCount(letter));
		
		System.out.println(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("mymaillist", myMapper.selectMail(letter));
		return "mypage/my_mail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/onemailselect")
	public Letter oneMailSelect(Model model, HttpServletRequest request, Letter letter) throws IOException{
		System.out.println("ㄴ오리ㅏㅁ너ㅗ라ㅣㅇㄴ머ㅗㄹ아ㅓㅣㄴ몰ㄴ아ㅗ"+request.getParameter("lett_no"));
		letter.setLett_no(request.getParameter("lett_no"));
		letter = myMapper.OneMailSelect(letter);
		
		return letter;
	}
	
		
	// 쪽지보내기
	@RequestMapping(value = "/sendmail")
	public ModelAndView sendmail(HttpServletResponse response, Letter letter) throws IOException {

		myMapper.SendMail(letter);
		return new ModelAndView("mypage/my_mail");
	}
	
	
	
	
	
	
	
	
	
	// my1:1main
	@RequestMapping(value = "/my1o1")
	public ModelAndView my1o1(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_1o1");
	}

	// my1:1ask
	@RequestMapping(value = "/my1o1ask")
	public ModelAndView my1o1ask(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_1o1_ask");
	}
}