package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.CnoticeMapper;
import com.yedam.fandemic.impl.CompanyMapper;
import com.yedam.fandemic.vo.Cnotice;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Star;

@Controller
public class CompanyController {
	@Autowired
	CompanyMapper companyDao;
	@Autowired
	CnoticeMapper cnoticeDao;
	
	//소속사 메인페이지. 소속사 리스트를 출력한다.
	@RequestMapping(value="/company")
	public ModelAndView companyMain(Model model, Company comVo) throws IOException{
		model.addAttribute("companyList", companyDao.getCompanyMinInfo(comVo));
		return new ModelAndView("company/company_main");
	}
	
	//소속사 홈 메인페이지. 소속사의 스타목록 출력
	@RequestMapping(value="/company/home/{id}")
	public ModelAndView companyHome(@PathVariable String id, Star stVo, Model model) throws IOException{
		stVo.setCom_id(id);
		model.addAttribute("companyStars", companyDao.getCompanyStarMin(stVo));
		return new ModelAndView("company/company_home");
	}
	
	//소속사 홈페이지에서 소속사의 소개화면 출력
	@RequestMapping(value="/company/info/{id}")
	public ModelAndView companyInfo(@PathVariable String id, Company comVo, Model model) throws IOException{
		comVo.setCom_id(id);
		model.addAttribute("companyInfo", companyDao.getCompanyInfo(comVo));
		return new ModelAndView("company/company_info");
	}
	
	//소속사 공지사항 목록 출력
	@RequestMapping(value="/company/notify/{id}")
	public ModelAndView companyNotify(@PathVariable String id, Cnotice cnocVo, Model model) throws IOException{
		cnocVo.setCom_id(id);
		model.addAttribute("companyNotices", cnoticeDao.getCnoticeList(cnocVo));
		return new ModelAndView("company/company_notify");
	}
	
	//소속사 공지사항 세부내용 출력
	@RequestMapping(value="/company/notifyDetail/{no}")
	public ModelAndView companyNotifyDetail(@PathVariable String no, Cnotice cnocVo, Model model) throws IOException{
		cnocVo.setCnoc_no(no);
		model.addAttribute("companyNotice", cnoticeDao.getCnoticeDetail(cnocVo));
		return new ModelAndView("company/company_notify_detail");
	}
	
	
	@RequestMapping(value="/company/starProfile")
	public ModelAndView companyStarProfile(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star_profile");
	}
	
	@RequestMapping(value="/company/starMembers")
	public ModelAndView companyStarMembers(HttpServletResponse response) throws IOException{
		return new ModelAndView("company/company_star_members");
	}
}
