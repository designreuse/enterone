package com.yedam.fandemic.mypage;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
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
import com.yedam.fandemic.login.Password;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.QnA;
import com.yedam.fandemic.vo.Star;
import com.yedam.fandemic.vo.Untact;

@Controller
public class MypageController {

	@Autowired
	MypageMapper myMapper;

	// mypage메인
	@RequestMapping(value = "/mypagemain")
	public ModelAndView mymain(Model model, HttpServletResponse response,  Fan fan, HttpSession session,Letter letter ,Star star , HttpServletRequest request ) throws IOException {
		// 메인 내 스타 목록 출력
		Member member = (Member) session.getAttribute("member");
		// MemberVo를 불러서 Member캐스팅 session에 있는 member를 가져온다.
		
		fan.setMem_id(member.getMem_id());
		letter.setMem_id(member.getMem_id());
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}

		Paging paging = new Paging();

		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정

		letter.setLett_first(paging.getFirst());
		letter.setLett_last(paging.getLast());

		paging.setTotalRecord(myMapper.getletterCount(letter));
		model.addAttribute("starlist", myMapper.starmainselect(fan));
		model.addAttribute("paging", paging);
		model.addAttribute("maillist", myMapper.selectMail(letter));
				// 만양ㄱ member가 null이 아니면 밑에 실행한다.
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
			HttpSession session) throws IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images/member_pic");

			System.out.println("path=" + path);

			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			member.setMem_pic(multipartFile.getOriginalFilename());
		}
		Password pw = new Password(); // 민 - pw 암호화 수정 0118 
		member.setMem_pw(pw.encrypt(member.getMem_pw()));
		myMapper.memUpdate(member);
		session.setAttribute("member", member);
		return "mypage/my_update";

	}       

	// my스타 메인
	@RequestMapping(value = "/mystar")
		public String selectAllMyStar(Model model, Star star, HttpSession session, HttpServletRequest request,Fan fan, HttpServletResponse response) throws IOException {
			Member member = (Member) session.getAttribute("member");
			star.setMem_id(member.getMem_id());
			String strp = request.getParameter("p");
			int p = 1;
			if (strp != null && !strp.equals("")) {
				p = Integer.parseInt(strp);
			}

			Paging paging = new Paging();

			paging.setPageUnit(4); // 한페이지에 5건씩. 생략시 기본10
			paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
			paging.setPage(p); // 현재 페이지 지정

			star.setSt_first(paging.getFirst());
			star.setSt_last(paging.getLast());

			paging.setTotalRecord(myMapper.selectAllStarpag(star));

			System.out.println(paging);

			model.addAttribute("paging", paging);
			model.addAttribute("starlist", myMapper.selectStar(star));
			
			return "mypage/my_star";
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
	public String newmail(Model model, Letter letter, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Member member = (Member) session.getAttribute("member");
		letter.setMem_id(member.getMem_id());
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
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
		model.addAttribute("memberidlist", myMapper.selectmemberid(member));
		model.addAttribute("paging", paging);
		model.addAttribute("mymaillist", myMapper.selectMail(letter));
		return "mypage/my_mail";
	}
	
	//보낸쪽지 조회하기
	@RequestMapping(value = "/yourmail")
		public String yourmail(Model model, Letter letter, HttpSession session, HttpServletRequest request,
				HttpServletResponse response) throws IOException {
	
			Member member = (Member) session.getAttribute("member");
			letter.setMem_id(member.getMem_id());
			String strp = request.getParameter("p");
			int p = 1;
			if (strp != null && !strp.equals("")) {
				p = Integer.parseInt(strp);
			}
	
			Paging paging = new Paging();
	
			paging.setPageUnit(15); // 한페이지에 5건씩. 생략시 기본10
			paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
			paging.setPage(p); // 현재 페이지 지정
	
			letter.setLett_first(paging.getFirst());
			letter.setLett_last(paging.getLast());
	
			paging.setTotalRecord(myMapper.getYourletterCount(letter));
	
			System.out.println(paging);
			model.addAttribute("memberidlist", myMapper.selectmemberid(member));
			model.addAttribute("paging", paging);
			model.addAttribute("mymaillist", myMapper.selectYourMail(letter));
			return "mypage/your_mail";
		}
	//쪽지 단건조회
	@ResponseBody
	@RequestMapping(value = "/onemailselect")
	public Letter oneMailSelect(Model model, HttpServletRequest request, Letter letter) throws IOException {
		letter.setLett_no(request.getParameter("lett_no"));
		letter = myMapper.OneMailSelect(letter);
		return letter;

	}

	// 쪽지보내기
	@RequestMapping(value = "/sendmail")
	public ModelAndView sendmail(HttpServletResponse response, Letter letter, Member member, Model model) throws IOException {
		
		String snss = letter.getSnsns();
		myMapper.SendMail(letter);
		System.out.println(snss);
		if(snss.equals("1")) {
			return new ModelAndView("redirect:sns");
		} if (snss.equals("2")) {
			return new ModelAndView("redirect:yourmail");
		} else {
			return new ModelAndView("redirect:mymail");
		}
	}
	// 쪽지 삭제하기
	@RequestMapping("/deletemail")
	@ResponseBody
	public ModelAndView deleteMail(Model model, Letter letter, HttpServletRequest request) throws IOException{
		
		String sns = letter.getSnsns();
		System.out.println(sns);
		myMapper.deletemail(letter);
		if(sns == null ) {
			return new ModelAndView("redirect:mymail");
		} else {
			return new ModelAndView("redirect:yourmail");
		}
	}
	
	//==================QnA===========================
	// my1:1main
	@RequestMapping(value = "/my1o1")
	public String my1o1(Model model, QnA qna, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Member member = (Member) session.getAttribute("member");
		qna.setMem_id(member.getMem_id());
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}

		Paging paging = new Paging();

		paging.setPageUnit(15); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정

		qna.setQ_first(paging.getFirst());
		qna.setQ_last(paging.getLast());

		paging.setTotalRecord(myMapper.getQnACount(qna));

		System.out.println(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("qnalist", myMapper.selectQnA(qna));
		return "mypage/my_1o1";
	}

	// my1:1ask
	@RequestMapping(value = "/sendqna")
	public ModelAndView my1o1ask(HttpServletResponse response, QnA qna) throws IOException {

		myMapper.SendQnA(qna);
		return new ModelAndView("redirect:my1o1");
	}

	// my1:1ask
	@RequestMapping(value = "/my1o1ask")
	public ModelAndView my1o1ask(HttpServletResponse response) throws IOException {
		return new ModelAndView("mypage/my_1o1_ask");
	}

	// QnA단건조회
	@ResponseBody
	@RequestMapping(value = "/oneqnaselect")
	public QnA oneQnASelect(Model model, HttpServletRequest request, QnA qna) throws IOException {
		qna.setQ_no(request.getParameter("q_no"));
		qna = myMapper.OneQnASelect(qna);

		return qna;

	}
	//QnA 삭제
	@RequestMapping("/deleteqna")
	@ResponseBody
	public ModelAndView deleteqna(Model model, QnA qna, HttpServletRequest request) throws IOException{
		
		myMapper.deleteqna(qna);
		System.out.println(qna);
		return new ModelAndView("redirect:my1o1");
}
	
	//회원탈퇴
	@RequestMapping("/deleteMember")
	@ResponseBody
	public int deleteMemeber(HttpServletRequest request, Member member) {
		HttpSession session = request.getSession(false);
		request.getSession(true).invalidate();
		return myMapper.deleteMember(member);
	}
	
	//MY Untack Ticket 확인, 참여 할수있음
	@RequestMapping(value = "/myUntact")
	public ModelAndView myUntact(HttpServletResponse response, Untact untact, Model model, HttpServletRequest request) throws IOException {
		String strp = request.getParameter("p");
		int p = 1;
		          
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		
		paging.setPageUnit(3); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		untact.setU_first(paging.getFirst());
		untact.setU_last(paging.getLast());
		
		paging.setTotalRecord(myMapper.unCnt());
		
		model.addAttribute("paging",paging);
		model.addAttribute("unList", myMapper.untactList(untact));
		
		//커밍순 리스트
		List<Map<String, Object>> list = myMapper.comingsoonList();
		model.addAttribute("comingList", list);
		model.addAttribute("cnt", list.size());
		return new ModelAndView("untact/myUntact");
	}
	
	
	
	
	}