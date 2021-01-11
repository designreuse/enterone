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
import com.yedam.fandemic.vo.Sns;
import com.yedam.fandemic.vo.Trainee;

@Controller
public class AuditionController {
	// @Autowired TraineeService traineeservice;
	@Autowired
	TraineeMapper traineeMapper;

	// 연습생 활동 페이지
	@RequestMapping(value = "/audition/auditionwork") // 주소
	public ModelAndView traineeactivity(Model model, HttpServletRequest request, Activity activity) throws IOException {
		model.addAttribute("TrworkList", traineeMapper.selectActivity());

		return new ModelAndView("audition/trainee_list");

	}

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

		traineeMapper.inserttr(trainee);

		return "audition/trainee_list";
	}
	// 닉네임인 중복확인
		@RequestMapping(value = "/audition/nickCheck")
		@ResponseBody
		public int nickId(Model model, Trainee trainee) throws IOException {

			System.out.println("닉네임 중복확인");
			return traineeMapper.nickCheck(trainee);

		}
//연습생 활동 글등록 페이지 
	@RequestMapping(value = "/audition/activityinsert")
	public ModelAndView activityinsert(Model model, Activity activity, HttpSession session) throws IOException {	
		return new ModelAndView("audition/activity_insert");
	}
	//연습생 활동 글쓰기
//	@RequestMapping(value = "/activitywrite")
//	@ResponseBody
//	public boolean snsInsert(HttpServletRequest request, Activity activity) throws IllegalStateException, IOException {
//		// request multipart로 캐스팅
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//		// 이미지파일
//		List<MultipartFile> multipartFile = multipartRequest.getFiles("upload-file");
//		// 첨부파일
//		String imgname = "";
//		for (int i = 0; i < multipartFile.size(); i++) {
//			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
//				String path = request.getSession().getServletContext().getRealPath("/images/snsimage");
//
//				System.out.println("path=" + path);
//
//				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
//
//				imgname += multipartFile.get(i).getOriginalFilename() + ",";
//
//			}
//		}
//		sns.setSns_pic(imgname);
//
//		snsdao.insertSns(sns);
//		return true;
//	}
	

}
