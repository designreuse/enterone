package com.yedam.fandemic.company;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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
import com.yedam.fandemic.vo.Paging;
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
	public ModelAndView companyInfo(@PathVariable String id, Company comVo , Star stVo, Model model) throws IOException{
		comVo.setCom_id(id);
		model.addAttribute("companyInfo", companyDao.getCompanyInfo(comVo));
		stVo.setCom_id(id);
		model.addAttribute("companyStars", companyDao.getCompanyStarMin(stVo));
		return new ModelAndView("company/company_info");
	}
	
	//소속사 공지사항 목록 출력
	@RequestMapping(value="/company/notify/{id}")
	public ModelAndView companyNotify(@PathVariable String id, HttpServletRequest request, Cnotice cnocVo, Model model) throws IOException{
		cnocVo.setCom_id(id);
		
		model.addAttribute("comBanner", companyDao.getCnoticeBanner(cnocVo));
		
		String strp = request.getParameter("p");
		int p = 1;
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(15); // 한페이지에 15건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		cnocVo.setCnoc_first(paging.getFirst());
		cnocVo.setCnoc_last(paging.getLast());
		
		paging.setTotalRecord(companyDao.getCnoticeCount(cnocVo));
		
		System.out.println(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("companyNotices", companyDao.getCnoticeListPaging(cnocVo));
		return new ModelAndView("company/company_notify");
	}
	
	//소속사 공지사항 세부내용 출력
	@RequestMapping(value="/company/notifyDetail/{id}")
	public ModelAndView companyNotifyDetail(@PathVariable String id, HttpServletRequest request, Cnotice cnocVo, Model model) throws IOException{
		
		cnocVo.setCom_id(id);
		String no = request.getParameter("no");
		if(no != null) {
			cnocVo.setCnoc_no(no);	
		}
		model.addAttribute("companyNotice", cnoticeDao.getCnoticeDetail(cnocVo));
		model.addAttribute("comBanner", companyDao.getCnoticeBanner(cnocVo));
		return new ModelAndView("company/company_notify_detail");
	}
}
