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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.login.Password;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Trainee;

@Controller
public class AuditionController {
	@Autowired
	AuditionService auditionservice;
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

	// 연습생 활동 글 등록
	@RequestMapping(value = "/audition/traineeinsertsend")

	public String Inserttr(HttpServletRequest request, Model model, Trainee trainee)
			throws IllegalStateException, IOException {
		System.out.println("++++++");
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";
		// 이미지파일, 공지사항 첨부파일
		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				trainee.setTr_pic(sumFile);
			} else {
				trainee.setTr_pic("");
			}
		}

		auditionservice.inserttr(trainee);
		model.addAttribute("msg", "등록됐습니다.");
		return "redirect:/audition/auditionwork";
	}

	// 닉네임인 중복확인
	@RequestMapping(value = "/audition/nickCheck")
	@ResponseBody
	public int nickId(Model model, Trainee trainee) throws IOException {
		return auditionMapper.nickCheck(trainee);

	}

	// 연습생 활동 페이지
	@RequestMapping(value = "/audition/auditionwork") // 주소
	public ModelAndView auditionwork(Model model, HttpServletRequest request, Activity activity) throws IOException {
		model.addAttribute("TrworkList", auditionMapper.selectTr());

		return new ModelAndView("audition/trainee_list");

	}

//연습생 활동 글등록 페이지 
	@RequestMapping(value = "/audition/activityinsert")
	public ModelAndView activityinsert(Model model, Activity activity, HttpSession session) throws IOException {
		return new ModelAndView("audition/activity_insert");
	}

	// 연습생 활동 글 등록
	@RequestMapping(value = "/audition/activityinsertsend")
	public String Insertac(HttpServletRequest request, Model model, Activity activity)
			throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";
		// 이미지파일, 공지사항 첨부파일
		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				activity.setAc_file(sumFile);
			} else {
				activity.setAc_file("");
			}
		}

		auditionservice.insertac(activity);
		model.addAttribute("msg", "등록됐습니다.");
		return "redirect:/audition/auditionwork";

	}

	//연습생 활동 글수정 페이지 
		@RequestMapping(value = "/audition/activityupdate")
		public ModelAndView activityupdate(Model model, Activity activity, HttpSession session) throws IOException {
			
			Member member = (Member)session.getAttribute("member");	// 세션에 저장해둔 member 불러오기
			activity.setMem_id(member.getMem_id());						// activity에 아이디를 넣은거	
			model.addAttribute("AcworkList",auditionMapper.activityUpdateselect(activity));			
			return new ModelAndView("audition/activity_update");
		}
	
	// 연습생 활동 글 수정
	@RequestMapping(value = "/audition/activityupdatesend")
	public String UpdateAboard(HttpServletRequest request, Model model, Activity activity)
			throws IllegalStateException, IOException {		
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";
		// 이미지파일, 공지사항 첨부파일
		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				activity.setAc_file(sumFile);
			}
		}
		auditionservice.activityUpdate(activity);
		return "redirect:/audition/auditionwork";
	}
	//연습생 활동 지원 글 삭제
	@RequestMapping(value = "/audition/activitydelete", method = RequestMethod.POST)
	@ResponseBody
	public boolean activityDelete(HttpSession session, HttpServletRequest request, Activity activity) throws IOException {
		Member member = (Member)session.getAttribute("member");	// 세션에 저장해둔 member 불러오기
		activity.setMem_id(member.getMem_id());						
		activity.setAc_no(request.getParameter("ac_no"));
		auditionMapper.activityDelete(activity);
		return true;
	}
	// 활동 상세 프로필
	@RequestMapping(value = "/ActivityDetail/{mem_id}")
	public ModelAndView ActivityDetail(@PathVariable String mem_id, Activity activity, Model model) throws IOException {
		// 단건
		activity.setMem_id(mem_id);
		model.addAttribute(auditionMapper.activityDetail(activity));
		return new ModelAndView("audition/trainee_profile");
	}		


}
