package com.yedam.fandemic.star;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.service.StarServiceD;
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
	public List<Star> getStarMemberList(Star star){
		return starService.getStarMemberList(star);
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
	public String starMemberInsert(HttpServletRequest request, Star star) throws IllegalStateException, IOException {
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
	      
	    //스타회원 프로필 사진
	      MultipartFile uploadBanner = multipartRequest.getFile("uploadBanner");
	      if (!uploadBanner.isEmpty() && uploadBanner.getSize() > 0) {
	    	  String path = request.getSession().getServletContext().getRealPath("/images/star");
	    	  System.out.println("path="+path);
	    	  uploadBanner.transferTo(new File(path, uploadBanner.getOriginalFilename()));
	         star.setSt_banner(uploadBanner.getOriginalFilename());
	      }else {
	    	  star.setSt_banner("");
	      }
		starService.InsertStar(star);
		return "mgt/star/starList"; //스타회원목록 리스트로 
	}
		
	//소속사 스타회원 수정 페이지 이동, id값받아옴
	@RequestMapping(value="/management/star/starDetail")
	public String StarDetail(Model model, Star star) {
		model.addAttribute("star",starService.getStarDetail(star));
		return "mgt/star/starDetail";
	}
	
}
