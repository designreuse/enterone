package com.yedam.fandemic.management;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;

@Controller
public class CompanyControllerD {
	@Autowired CompanyServiceD companyService;
	
	//소속사 마이페이지 정보조회
	@RequestMapping(value="/management/company/myPage")
	public String myPage(Model model, Company company) {
		model.addAttribute("company",companyService.getMyCompanyInfo(company));
		return "mgt/company/myPage";
	}
	
	//소속사 정보 업데이트 
	@RequestMapping(value="/management/company/updateCompanyUpdate")
	public String updateCompanyUpdate(HttpServletRequest request, Model model, Company company) throws IllegalStateException, IOException {
		//System.out.println("company정보: =="+company);
		 //공지사항 배너
	      MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
	      MultipartFile multipartFile1 = multipartRequest1.getFile("uploadBanner");
		      if (!multipartFile1.isEmpty() && multipartFile1.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/company");
		    	  System.out.println("path="+path);
		         multipartFile1.transferTo(new File(path, multipartFile1.getOriginalFilename()));
		         company.setCom_pic(multipartFile1.getOriginalFilename());
		      }
		    
		companyService.updateCompanyUpdate(company);
		model.addAttribute("company",companyService.getMyCompanyInfo(company));
		return "mgt/company/myPage";
	}
}
