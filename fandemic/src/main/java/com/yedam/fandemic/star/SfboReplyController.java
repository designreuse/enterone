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
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Reply;

@Controller
public class SfboReplyController {
	@Autowired
	ReplyService replyService;
	
	//게시물 목록 출력
	@RequestMapping(value="/star/fanBoard/reply", method=RequestMethod.GET)
	@ResponseBody
	public List<Reply> fboardList(HttpServletRequest request, Model model, Reply reply) {
		reply.setSfbo_no(request.getParameter("fbo_no"));		
		return  replyService.getReplyList(reply);
	}
	
	//입력
	@RequestMapping(value="/star/fanBoard/reply", method=RequestMethod.POST)
	@ResponseBody
	public boolean fboardInsert(HttpServletRequest request, Reply reply,  HttpSession session) throws IOException {
	    Member member = (Member) session.getAttribute("member");
	    reply.setMem_id(member.getMem_id());
	    
	    replyService.insertReply(reply);
		return true;
	}
}











