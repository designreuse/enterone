package com.yedam.fandemic.management;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.login.Password;
import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

@Controller
public class StarControllerD {
	@Autowired StarServiceD starService; 
	
	//소속사 스타관리 페이지 이동
	@RequestMapping(value="/management/star/starList")
	public String StarManagement(){
		return "mgt/star/starList";
	}
	
	
	//소속사 스타회원 리스트 출력
	@RequestMapping(value="/management/star/starMemberList")
	@ResponseBody //결과를 Json형태로 변환
	public List<Star> getStarMemberList(Star star) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		Password pw = new Password();
		List<Star> list = starService.getStarMemberList(star);
		for(int i=0; i<list.size(); i++) {
			list.get(i).setSt_pw(pw.aesDecode(list.get(i).getSt_pw()));

		}
		return list;
	}
	
	//소속사 스타회원 등록 페이지 이동
	@RequestMapping(value="/management/star/starInsertForm")
	public String StarInsertForm() {
		return "mgt/star/starInsertForm";
	}
	
	//소속사 스타회원가입 ID 중복체크
	@RequestMapping(value="/management/star/starIdCheck")
	@ResponseBody
	public int StarIdCheck(Model model, Star star) {	
		return starService.getStarIdCheck(star);
	}
		
	//소속사 스타회원 등록
	@RequestMapping(value="/management/star/starMemberInsert")
	public String starMemberInsert(HttpServletRequest request, Star star) throws IllegalStateException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      //스타회원 아이콘 사진
	      MultipartFile uploadIcon = multipartRequest.getFile("uploadIcon");
		      if (!uploadIcon.isEmpty() && uploadIcon.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
		    	  System.out.println("path="+path);
		    	  uploadIcon.transferTo(new File(path, uploadIcon.getOriginalFilename()));
		         star.setSt_icon(uploadIcon.getOriginalFilename());
		      }else {
		    	  star.setSt_icon("");
		      }
		  //스타회원 프로필 사진
	      MultipartFile uploadProfile = multipartRequest.getFile("uploadProfile");
	      if (!uploadProfile.isEmpty() && uploadProfile.getSize() > 0) {
	    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
	    	  System.out.println("path="+path);
	    	  uploadProfile.transferTo(new File(path, uploadProfile.getOriginalFilename()));
	         star.setSt_pic(uploadProfile.getOriginalFilename());
	      }else {
	    	  star.setSt_pic("");
	      }
	      
	    //스타회원 배너 사진
	      MultipartFile uploadBanner = multipartRequest.getFile("uploadBanner");
	      if (!uploadBanner.isEmpty() && uploadBanner.getSize() > 0) {
	    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
	    	  System.out.println("path="+path);
	    	  uploadBanner.transferTo(new File(path, uploadBanner.getOriginalFilename()));
	         star.setSt_banner(uploadBanner.getOriginalFilename());
	      }else {
	    	  star.setSt_banner("");
	      }
	      Password pw = new Password();
	      star.setSt_pw(pw.encrypt(star.getSt_pw()));
		starService.InsertStar(star);
		return "redirect:/management/star/starList"; //스타회원목록 리스트로 
	}
		
	//소속사 스타회원 수정 페이지 이동, id값받아옴
	@RequestMapping(value="/management/star/starDetail")
	public String StarDetail(Model model, Star star) {
		model.addAttribute("star",starService.getStarDetail(star));
		return "mgt/star/starDetail";
	}
	
	
	//소속사 스타회원 정보 수정할값 DB로 넘기기
	@RequestMapping(value="/management/star/starMemberUpdate")
	public String StarMemberUpdate(HttpServletRequest request, Star star) throws IllegalStateException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      //스타회원 아이콘 사진
	      MultipartFile uploadIcon = multipartRequest.getFile("uploadIcon");
		      if (!uploadIcon.isEmpty() && uploadIcon.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
		    	  System.out.println("path="+path);
		    	  uploadIcon.transferTo(new File(path, uploadIcon.getOriginalFilename()));
		         star.setSt_icon(uploadIcon.getOriginalFilename());
		      }
		  //스타회원 프로필 사진
	      MultipartFile uploadProfile = multipartRequest.getFile("uploadProfile");
	      if (!uploadProfile.isEmpty() && uploadProfile.getSize() > 0) {
	    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
	    	  System.out.println("path="+path);
	    	  uploadProfile.transferTo(new File(path, uploadProfile.getOriginalFilename()));
	         star.setSt_pic(uploadProfile.getOriginalFilename());
	      }
	      
	    //스타회원 배너 사진
	      MultipartFile uploadBanner = multipartRequest.getFile("uploadBanner");
	      if (!uploadBanner.isEmpty() && uploadBanner.getSize() > 0) {
	    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
	    	  System.out.println("path="+path);
	    	  uploadBanner.transferTo(new File(path, uploadBanner.getOriginalFilename()));
	         star.setSt_banner(uploadBanner.getOriginalFilename());
	      }
	      Password pw = new Password();
	      System.out.println("암호입력하지않은경우수정"+star.getSt_pw());
	      if(!star.getSt_pw().equals(null) && !star.getSt_pw().equals("")) {
	    	  star.setSt_pw(pw.encrypt(star.getSt_pw()));//패스워드가 null이나 nullString이 아닐경우만 암호화
	    	  System.out.println("암호화됬다"+star.getSt_pw());
	      }
	      System.out.println("암호화되지않아야한다"+star.getSt_pw());
		starService.updateStarMember(star); //star값 받아서 update문실행
		return "redirect:/management/star/starList"; //스타회원 목록으로 
	}
	
	//스타회원 삭제
	@RequestMapping(value = "/management/star/starDelete")
	@ResponseBody //결과값을 JSON형태로
	public int starMemberDelete(Star star) {
		int result = starService.deleteStarMember(star); //성공하면 결과값을 떤진다.
		return result;
	}
	
	//소속사 스타 스케줄 페이지 이동
	@RequestMapping(value="/management/star/starSchedule")
	public String StarSchedule(Model model, Star star){
		model.addAttribute("st_id", star.getSt_id());
		model.addAttribute("st_name",star.getSt_name());
		return "mgt/star/starSchedule";
	}
	
	//소속사 스타 스케줄 등록
	@RequestMapping(value="/management/star/insertSchedule")
	@ResponseBody //결과를 Json형태로 변환
	public int insertSchedule(Schedule schedule) {
		System.out.println("스케줄정보:"+schedule.getSch_bgColor());//스케줄값 넘어오는지 확인 
		return starService.insertStarSchedule(schedule);
	}
	
	//소속사 해당 스타 스케줄 리스트 불러오기
	@RequestMapping(value="/management/star/ScheduleList")
	@ResponseBody
	public List<Schedule> ScheduleList(Schedule schedule){
		//System.out.println("id값"+schedule.getSt_id());
		return starService.getStartList(schedule);
	}
	
	//소속사 해당스타 스케줄 리스트 수정하기
	@RequestMapping(value="/management/star/updateSchedule")
	@ResponseBody
	public int updateSchedule(Schedule schedule){
		return starService.updateStarSchedule(schedule);
	}
	
	//소속사 해당스타 스케줄 삭제하기                              
	@RequestMapping(value="/management/star/deleteSchedule")
	@ResponseBody
	public int deleteSchedule(Schedule schedule) {
		return starService.deleteStarSchedule(schedule);
	}
	
	//스타 작품등록 페이지 이동
	@RequestMapping(value="/management/star/starWork")
	public String starWork(Model model, Art art) {
		model.addAttribute("art", art);
		return "mgt/star/starWork";
	}
	
	//스타 작품 리스트 요청
	@RequestMapping(value="/management/star/starWorkList")
	@ResponseBody
	public List<Art> getStarWorkList(Art art){
		return starService.getStarWorkList(art);
	}
	
	//스타 작품 등록 폼 이동
	@RequestMapping(value="/management/star/starWorkInsertForm")
	public String starWorkInsertForm(Model model, Art art) {
		model.addAttribute("art",art); //스타 id값, 스타이름을넘김
		return "mgt/star/starWorkInsertForm";
	}
	
	//스타 작품 등록
	@RequestMapping(value="/management/star/insertStarWork")
	public String insertStarWork(HttpServletRequest request, Model model, Art art) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
	      //공지사항 배너
	      MultipartFile multipartFile1 = multipartRequest1.getFile("uploadImage");
		      if (!multipartFile1.isEmpty() && multipartFile1.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/star/art");
		    	  System.out.println("path="+path);
		         multipartFile1.transferTo(new File(path, multipartFile1.getOriginalFilename()));
		         art.setArt_pic(multipartFile1.getOriginalFilename());
		      }
		      String st_name = URLEncoder.encode(art.getSt_name(),"UTF-8");
		starService.insertStarWork(art);
		return "redirect:/management/star/starWork?st_id="+art.getSt_id()+"&st_name="+st_name;
	}
	
	//스타 작품 삭제
	@RequestMapping(value="management/star/starWorkDelete")
	@ResponseBody
	public int deleteStarWork(Art art) {
		return starService.deleteStarWork(art);
		
	}
	
	//스타 작품 상세보기
	@RequestMapping(value="/management/star/starWorkDetail")
	public String starWorkDetail(Model model, Art art) {
		model.addAttribute("art",starService.starWorkDetail(art));
		return "mgt/star/starWorkDetail";
	}
	
	//스타 작품 수정
	@RequestMapping(value="/management/star/updateStarWork")
	public String updateStarWork(HttpServletRequest request, Art art) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
	      //공지사항 배너
	      MultipartFile multipartFile1 = multipartRequest1.getFile("uploadImage");
		      if (!multipartFile1.isEmpty() && multipartFile1.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/star/art");
		    	  System.out.println("path="+path);
		         multipartFile1.transferTo(new File(path, multipartFile1.getOriginalFilename()));
		         art.setArt_pic(multipartFile1.getOriginalFilename());
		      }
		      String st_name = URLEncoder.encode(art.getSt_name(),"UTF-8");
		starService.updateStarWork(art);
		return "redirect:/management/star/starWork?st_id="+art.getSt_id()+"&st_name="+st_name;
	}
	
	//스타 팬현황 리스트 페이지 이동
	@RequestMapping(value="management/star/starFanInfo")
	public String starFanInfo(Model model, Fan fan,Star star) {
		//id랑 name값 가지고옴 스타의
		model.addAttribute("fan",fan);
		model.addAttribute("star",star);//name값
		return "mgt/star/starFanInfo";
	}
	
	//스타 팬 리스트 요청
	@RequestMapping(value="/management/star/starFanList")
	@ResponseBody
	public List<Fan> getStarFanList(Fan fan){
		return starService.getStarFanList(fan);
	}
	
	//스타 팬의 블랙리스트 해제
	@RequestMapping("/management/star/starFanBlack")
	@ResponseBody
	public int starFanBlack(Fan fan) {
		return starService.starFanBlack(fan);
	}
}
