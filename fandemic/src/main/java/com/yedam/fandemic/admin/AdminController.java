package com.yedam.fandemic.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AdminMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Filter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.QnA;



@Controller
public class AdminController {
	@Autowired AdminMapper dao;
	
	@RequestMapping(value="/adminMain")
	public ModelAndView Main() throws IOException{
		return new ModelAndView("admin/adminmain");
	}
	     
	
	@RequestMapping("/adminNotic")
	public String adminNotic() throws IOException{
		
		return "redirect:notice";
	}
	
	
	@RequestMapping("/adminQuestion")
	public String adminQuestion() throws IOException{
		
		return "redirect:question";
	}
	
	// 개인회원 목록
	@RequestMapping("/adminMember")
	public String adminMember(Model model, HttpServletRequest request, Member member) throws IOException{
		
		String strp = request.getParameter("p");
		int p = 1;
		
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		
		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		member.setMem_first(paging.getFirst()); //paging에 현재 페이지만 넣으면 first, lastPage를 계산함
		member.setMem_last(paging.getLast());
		
		paging.setTotalRecord(dao.memCount());

		
		
		model.addAttribute("paging", paging);
		model.addAttribute("member", dao.memberList(member));
		
		
		return "admin/memberList";
		
	}
	// 기업회원 목록
	@RequestMapping("/adminCompany")
	public String adminCompany(Model model, HttpServletRequest request, Company company) throws IOException{
		
		String strp = request.getParameter("p");
		int p = 1;
		
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		company.setCom_first(paging.getFirst());
		company.setCom_last(paging.getLast());
		
		paging.setTotalRecord(dao.comCount());
		
		model.addAttribute("paging", paging);
		model.addAttribute("company", dao.companyList(company));
	
		return "admin/companyList";
		
	}
	
	// 금칙어 목록
	@RequestMapping("/adminFilter")
	public String adminFilter(Model model, HttpServletRequest request, Filter filter) throws IOException{
		
		
		String strp = request.getParameter("p");
		int p = 1;
		
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		filter.setFil_first(paging.getFirst());
		filter.setFil_last(paging.getLast());
		
		paging.setTotalRecord(dao.filCount());
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("filter", dao.filterList(filter));

		return "admin/filter";
	}
	
	// 금칙어 등록, 수정
	
	@RequestMapping("/filterAdd")
	@ResponseBody
	public void filterAdd(Model model, Filter filter, HttpServletRequest request) throws IOException{
		
		String fil_prohibited = request.getParameter("fil_prohibited"); //금칙어
		String fil_alternative = request.getParameter("fil_alternative"); //대체어
		
		
		filter.setFil_prohibited(fil_prohibited); // 금칙어 가져와서
		
		
		if (dao.filterSel(filter) != 0) { // 중복이면 
			filter.setFil_alternative(fil_alternative); // 대체어만 넣어서
			dao.filterUpdate(filter); // 수정
			
		} else { // 중복이 아니면
			filter.setFil_prohibited(fil_prohibited); //금칙어 다시 넣고
			filter.setFil_alternative(fil_alternative); // 대체어도 넣고
			dao.filterAdd(filter); // 등록
		}
		
	}
	
	
	// 금칙어 삭제
	@RequestMapping("/filterDel")
	@ResponseBody
	public String filterDel(Model model, Filter filter, HttpServletRequest request, String[] list) throws IOException{
		
		filter.setList(list);
		dao.filterDelete(filter);
		
		return null;
	}
	
	
	@RequestMapping("/adminQna")
	public String QnaList(Model model, HttpServletRequest request, QnA qna) throws IOException{

		List<QnA> list = dao.qnaList();
		model.addAttribute("qna", list);
		
		return "admin/qnaList";

	}
	
	@RequestMapping("/qnaInsert")
	public String qnaInsert(Model model, HttpServletRequest request, QnA qna) throws IOException{
		
		qna.setQ_no(request.getParameter("no"));
		qna = dao.qnaOne(qna);
		model.addAttribute("qna", qna);
		
		return "admin/qnaOne";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
