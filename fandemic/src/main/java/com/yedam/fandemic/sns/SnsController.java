package com.yedam.fandemic.sns;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.SnsMapper;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Sns;
@Controller
public class SnsController {
	@Autowired
	SnsMapper snsdao;
	
	
	
	@RequestMapping(value = "/sns")
	public String sns(Model model, Sns sns, HttpSession session) throws IOException {
		
		model.addAttribute("snslist", snsdao.selectSns(sns));
		Member member = (Member)session.getAttribute("member");
		// MemberVo를 불러서 Member캐스팅 session에 있는 member를 가져온다.
		
		if(member != null) {
		sns.setMem_id(member.getMem_id());
		
		model.addAttribute("mysnslist", snsdao.selectMySns(sns));
		model.addAttribute("countmysns", snsdao.countMySns(sns));
		//만양ㄱ member가 null이 아니면 밑에 실행한다. 
		}
		return "sns/sns";
	}
	// SNS 등록
	@RequestMapping(value = "/sns/snsInsert")
	public String snsInsert(Sns sns) {
		snsdao.insertSns(sns);
		
		
		return "sns/sns";
	}

		

}
