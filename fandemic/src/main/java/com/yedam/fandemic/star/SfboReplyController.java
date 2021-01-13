package com.yedam.fandemic.star;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.fandemic.service.ReplyService;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Reply;
import com.yedam.fandemic.vo.Star;

@Controller
public class SfboReplyController {
	@Autowired
	ReplyService replyService;
	
	//댓글 목록 출력
	@RequestMapping(value="/star/fanBoard/reply", method=RequestMethod.GET)
	@ResponseBody
	public List<Reply> replyFboardList(HttpServletRequest request, Model model, Reply reply) {
		reply.setSfbo_no(request.getParameter("fbo_no"));      
		return  replyService.getReplyList(reply);
	}
	
	//댓글 목록 출력
	@RequestMapping(value="/star/starBoard/reply", method=RequestMethod.GET)
	@ResponseBody
	public List<Reply> replySboardList(HttpServletRequest request, Model model, Reply reply) {
		reply.setSfbo_no(request.getParameter("sbo_no"));      
		return  replyService.getReplyList(reply);
	}
	
   //입력
   @RequestMapping(value="/star/fanBoard/reply", method=RequestMethod.POST)
   @ResponseBody
   public boolean fboardInsert(HttpServletRequest request, Reply reply,  HttpSession session) throws IOException {
       Member member = (Member) session.getAttribute("member");
       if (member != null) {//유저 아이디 확인
    	   reply.setMem_id(member.getMem_id());    	   
       }else {//또는 스타
    	   Star star = (Star) session.getAttribute("star");
    	   reply.setSt_id(star.getSt_id());    
       }
       
       replyService.insertReply(reply);
      return true;
   }
	
	//수정
	@RequestMapping(value="/star/fanBoard/reply/update", method=RequestMethod.POST)
	@ResponseBody
	public boolean replyUpdate(HttpServletRequest request, Reply reply) throws IOException {
		replyService.updateReply(reply);
		return true;
	}
	
    //삭제
	@RequestMapping(value="/star/fanBoard/reply/delete/", method=RequestMethod.POST)
	@ResponseBody
	public boolean replyDelete(HttpServletRequest request, Reply reply) throws IOException {
		replyService.deleteReply(reply);
		return true;
	}
}










