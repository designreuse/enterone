package com.yedam.fandemic.cnotice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.impl.CnoticeMapper;
import com.yedam.fandemic.service.CnoticeService;
import com.yedam.fandemic.vo.Cnotice;

@Controller
public class CnoticeController {
	
	@Autowired
	CnoticeService cnoticeService;

	@RequestMapping(value = "/management/notices")
	public String Notices() {
		return "mgt/notices";
	}

	@RequestMapping(value = "/management/noticesInsertForm")
	public String noticesInsertForm() {
		return "mgt/noticesInsertForm";
	}
	
	//공지사항 삭제
	@RequestMapping(value = "/management/noticesDelete")
	@ResponseBody //결과를 Json형태로 
	public int noticesDelete(Cnotice cnotice) {
		int result = cnoticeService.deleteCnotice(cnotice);
		return result;
	}
	
	// 소속사 공지사항 등록
	@RequestMapping(value = "/management/noticesInsert")
	public String noticesInsert(HttpServletRequest request, Cnotice cnotice) throws IllegalStateException, IOException {
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile="";
	   // 이미지파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("uploadFile");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         cnotice.setCnoc_file(sumFile);
		      }
	      }
	      cnoticeService.insertCnotice(cnotice);
		return "mgt/notices";
	}
	
	//소속사 공지사항 목록 조회, ajax
	@RequestMapping(value="/management/noticesList")
	@ResponseBody
	public List<Cnotice> getCnoticeList(Cnotice cnotice) {	
		return cnoticeService.getCnoticeList(cnotice);
	}
	
	// 소속사 공지사항 상세보기
	@RequestMapping(value = "/management/noticesDetail")
	public String noticesDetail(Model model, Cnotice cnotice) {
		System.out.println(cnotice.getCnoc_no()); //클릭한게시물번호받아와서
		model.addAttribute("cnotice", cnoticeService.getCnoticeDetail(cnotice));//조회한후 값던짐
		return "mgt/noticesDetail";
	}
	
	//소속사 공지사항 수정
	@RequestMapping(value="/management/noticesUpdate")
	public String noticesUpdate(HttpServletRequest request, Model model, Cnotice cnotice) throws IllegalStateException, IOException  {
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile=request.getParameter("file_name");
	   // 이미지파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("uploadFile");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         cnotice.setCnoc_file(sumFile);
		      }
	      }
	      cnoticeService.updateCnotice(cnotice);
		model.addAttribute("cnotice", cnoticeService.getCnoticeDetail(cnotice));//조회한후 값던짐
		return "mgt/noticesDetail";
	}
		
	
}
