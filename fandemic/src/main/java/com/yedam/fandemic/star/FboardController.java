package com.yedam.fandemic.star;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.fandemic.service.FboardService;
import com.yedam.fandemic.service.StarService;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;

@Controller
public class FboardController {
   @Autowired
   FboardService fboardService;
   StarService starService;
   
	//게시물 목록 출력
	@RequestMapping(value="/star/fanBoard/list", method=RequestMethod.GET)
	@ResponseBody
	public List<Fboard> fboardList(HttpServletRequest request, Model model, Fboard fboard) {
		return  fboardService.getFboardList(fboard);
	}
   
   //게시물 상세보기
   @RequestMapping(value="/star/fanBoard/read/", method=RequestMethod.GET)
   @ResponseBody
   public Fboard fboardView(HttpServletRequest request, Fboard fboard, Model model) throws IOException {      
      fboard.setFbo_no(request.getParameter("fbo_no"));
      fboard = fboardService.getFboardInfo(fboard);
      //해시태그 #찾아서 배열로 담기
      if(fboard.getFbo_hashtag() != null) {
    	  String test4= fboard.getFbo_hashtag();
          Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
          Matcher m = p.matcher(test4);
          String extractHashTag = null;

          int i = 0;
          ArrayList<String> hashtag_array = new ArrayList<>();
          while(m.find()) {
    	      extractHashTag = m.group();
    	      if(extractHashTag != null) {
    	    	  hashtag_array.add(extractHashTag);
    	      }
          }
          fboard.setFbo_hashtag_array(hashtag_array);
      }
     
      
      return fboard;
   }
   
   //게시물 해시태그 별 목록 출력
   @RequestMapping(value="/star/fanBoard/list/hashtag", method=RequestMethod.GET)
   @ResponseBody
   public List<Fboard> fboardHashtagList(HttpServletRequest request, Model model, Fboard fboard) {      
      return  fboardService.getFboardHashtagList(fboard);
   }
   
   //게시물 말머리 별 목록 출력
   @RequestMapping(value="/star/fanBoard/list/subject", method=RequestMethod.GET)
   @ResponseBody
   public List<Fboard> fboardSubjectList(HttpServletRequest request, Model model, Fboard fboard) {      
      return  fboardService.getFboardSubjectList(fboard);
   }
   
   
   
   //입력
   @RequestMapping(value="/star/fanBoard", method=RequestMethod.POST)
   @ResponseBody
   public boolean fboardInsert(HttpServletRequest request, Fboard fboard,  HttpSession session) throws IOException {
       Member member = (Member) session.getAttribute("member");
       fboard.setMem_id(member.getMem_id());
      fboardService.insertFboard(fboard);
      return true;
   }
   
   //수정
   @RequestMapping(value="/star/fanBoard/update", method=RequestMethod.POST)
   @ResponseBody
   public boolean fboardUpdate(HttpServletRequest request, Fboard fboard) throws IOException {
      System.out.println(fboard);
      fboardService.updateFboard(fboard);
      return true;
   }
   
   //조회수 증가
   @RequestMapping(value="/star/fanBoard/viewsUpdate/", method=RequestMethod.POST)
   @ResponseBody
   public boolean fboardviewsUpdate(HttpServletRequest request, Fboard fboard) throws IOException {
      fboard.setFbo_no(request.getParameter("fbo_no"));
      fboardService.updateFboardViews(fboard);
      return true;
   }
   
   //삭제
   @RequestMapping(value="/star/fanBoard/delete/", method=RequestMethod.POST)
   @ResponseBody
   public boolean fboardDelete(HttpServletRequest request, Fboard fboard) throws IOException {
      fboard.setFbo_no(request.getParameter("fbo_no"));
      fboardService.deleteFboard(fboard);
      return true;
   }
}
