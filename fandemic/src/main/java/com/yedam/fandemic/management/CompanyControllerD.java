package com.yedam.fandemic.management;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
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
import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Gbuyer;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Notify;

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
	public String updateCompanyUpdate(HttpServletRequest request, Model model, Company company) throws IllegalStateException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
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
		    Password pw = new Password();
		    if(!company.getCom_pw().equals(null) && !company.getCom_pw().equals("")) {
		    	company.setCom_pw(pw.encrypt(company.getCom_pw()));//패스워드가 null이나 nullString이 아닐경우만 암호화
		    	  System.out.println("암호화됬다"+company.getCom_pw());
		      }
		companyService.updateCompanyUpdate(company);
		model.addAttribute("company",companyService.getMyCompanyInfo(company));
		return "mgt/company/myPage";
	}
	
	//소속사 쪽지 폼( 회원 리스트 요청)
	@RequestMapping(value="/management/company/myPageLetterForm")
	public String myPageLetter(Model model) {
		model.addAttribute("member",companyService.getMemberList());
		return "mgt/company/myPageLetterForm";
	}
	
	//쪽지 보낼 회원 체크 (존재여부)
	@RequestMapping(value="/management/company/memberCheck")
	@ResponseBody
	public int memberCheck(Member member) {
		return companyService.memberCheck(member);
	}
	
	//쪽지보내기
	@RequestMapping(value="/management/company/letterTrans")
	public String letterTrans(Letter letter) {
		companyService.letterTrans(letter);
		return "redirect:/management/company/myPageLetterForm";
	}
	
	//차트에 뿌려줄 데이터 검색(월별)
	@RequestMapping(value="/management/company/Chart")
	@ResponseBody
	public List<Gbuyer> getChartData(Gbuyer gbuyer) {
		return companyService.getCharData(gbuyer);
	}
	
	//일별 매출현황
	@RequestMapping(value="/management/company/DaySalesList")
	@ResponseBody
	public List<Gbuyer> getDaySalesList(Gbuyer gbuyer){
		return companyService.getDaySalesList(gbuyer);
	}
	
	//회원 신고 목록 페이지 이동
	@RequestMapping("/management/company/memberReport")
	public String memberReport(){
		return "mgt/company/memberReport";
	}
	
	//회원 신고당한놈 목록 요청
	@RequestMapping("/management/company/memberReportList")
	@ResponseBody
	public List<Notify> memberReportList(Notify notify){
		return companyService.memberReportList(notify);
	}
	
	//신고번호에 따른 상세 댓글신고
	@RequestMapping("/management/notifyDetailR")
	public String notifyDetailR(Model model, Notify notify) {
		//companyService.notifyDetailR(notify);
		model.addAttribute("notifyR",companyService.notifyDetailR(notify));
		return "mgt/company/notifyDetailR";
	}
	
	//신고번호에 따른 상세 게시글신고
	@RequestMapping("/management/notifyDetailF")
	public String notifyDetailF(Model model, Notify notify) {
		//companyService.notifyDetailF(notify);
		model.addAttribute("notifyF",companyService.notifyDetailF(notify));
		return "mgt/company/notifyDetailF";
	}
	
	//관리자가 직접 블랙리스트 추가
	@RequestMapping("/management/blackRegister")
	public String blackRegister(Model model, Fan fan) {
		companyService.blackRegister(fan);
		return "mgt/company/memberReport";
	}
	
//	//블랙리스트 자동추가(5개신고받으면?)
//	@RequestMapping("/management/company/blackAdd")
//	@ResponseBody
//	public List<Notify> blackAdd() {
//		return companyService.blackAdd();
//	}
}
