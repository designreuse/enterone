package com.yedam.fandemic.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.fandemic.impl.AdminMapper;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Filter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.QnA;



@Controller
public class AdminController {
	@Autowired AdminMapper dao;
	
	
	@RequestMapping("/test") // id,pw 찾기 팝업창  
	public ModelAndView test(Model model) throws IOException{
		
		List<Filter> list = new ArrayList<Filter>();
		list = dao.filBoard();
		
		Gson gson = new GsonBuilder().create();
		
		String filList = gson.toJson(list);
		
		model.addAttribute("filList", filList);
		return new ModelAndView("admin/test");
	}
	
	
	
	
	@RequestMapping(value="/adminMain")
	public ModelAndView Main(Model model, QnA qna, HttpServletRequest request) throws IOException{
		
		String strp = request.getParameter("p");
		int p = 1;
		          
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(3); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		qna.setQ_first(paging.getFirst());
		qna.setQ_last(paging.getLast());
		
		paging.setTotalRecord(dao.mainQnaCnt());
		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", dao.qnaAnswerNo(qna)); // 답변ㄴㄴ qna리스트
		
		Map<String, Integer> cnt = new HashMap<>();
		cnt.put("memCnt", dao.memCnt());
		cnt.put("comCnt", dao.comCnt());
		cnt.put("stCnt", dao.stCnt());
		
		model.addAttribute("cnt", cnt); // 회원별 count
		
		return new ModelAndView("admin/adminmain");
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
	
	//qna 리스트
	@RequestMapping("/adminQna")
	public String QnaList(Model model, HttpServletRequest request, QnA qna) throws IOException{

		
		String strp = request.getParameter("p");
		int p = 1;
		
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		
		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		qna.setQ_first(paging.getFirst());
		qna.setQ_last(paging.getLast());
		
		paging.setTotalRecord(dao.qnaCnt());

		model.addAttribute("paging",paging);
		model.addAttribute("qna", dao.qnaList(qna));
		
		return "admin/qnaList";

	}
	
	//qna 단건조회
	@ResponseBody
	@RequestMapping("/qnaOne")
	public QnA qnaInsert(Model model, HttpServletRequest request, QnA qna) throws IOException{
		
		qna.setQ_no(request.getParameter("no"));
		qna = dao.qnaOne(qna);
		
		return qna;
	}
	
	// qna 답변 등록 및 수정
	@ResponseBody
	@RequestMapping("/qnaAns")
	public void answerInsert(Model model, HttpServletRequest request, QnA qna ) throws IOException{
		
		qna.setQ_answer(request.getParameter("q_answer"));
		qna.setQ_no(request.getParameter("q_no"));
		
		// 매퍼 인터페이스에 등록하고 dao 불러서 테스트
		dao.answerUpdate(qna);
		
	}

	
	
	
}
