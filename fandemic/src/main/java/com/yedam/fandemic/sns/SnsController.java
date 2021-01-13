package com.yedam.fandemic.sns;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.impl.SnsMapper;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Sns;

@Controller
public class SnsController {
	@Autowired
	SnsMapper snsdao;

	@RequestMapping(value = "/sns")
	public String sns(Model model, Sns sns, HttpSession session) throws IOException {

		model.addAttribute("snslist", snsdao.selectSns(sns));
		Member member = (Member) session.getAttribute("member");
		// MemberVo를 불러서 Member캐스팅 session에 있는 member를 가져온다.

		if (member != null) {
			sns.setMem_id(member.getMem_id());

			model.addAttribute("mysnslist", snsdao.selectMySns(sns));			//SNS 사진 조회
			model.addAttribute("countmysns", snsdao.countMySns(sns));			//내SNS 카운트
			model.addAttribute("countlike", snsdao.countLike(sns));			//내 좋아요 카운트
			model.addAttribute("countmyletter", snsdao.countMyLetter(sns)); 	//쪽지 카운트
		}
		return "sns/sns";
	}

	// SNS 등록
	@RequestMapping(value = "/sns/snsInsert")
	@ResponseBody
	public boolean snsInsert(HttpServletRequest request, Sns sns) throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		List<MultipartFile> multipartFile = multipartRequest.getFiles("upload-file");
		// 첨부파일
		String imgname = "";
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/snsimage");

				System.out.println("path=" + path);

				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));

				imgname += multipartFile.get(i).getOriginalFilename() + ",";

			}
		}
		sns.setSns_pic(imgname);

		snsdao.insertSns(sns);
		return true;
	}

	// SNS 단건조회
	@ResponseBody
	@RequestMapping(value = "/onesnsselect")
	public Sns oneSnsSelect(Model model, HttpServletRequest request, Sns sns) throws IOException {
		sns.setSns_no(request.getParameter("sns_no"));
		sns = snsdao.OneSnsSelect(sns);

		return sns;

	}	
	
	//SNS MEMBERPROFILE 조회
	@ResponseBody
	@RequestMapping(value = "/profileselect")
	public Sns proFileSelect(Model model, HttpServletRequest request, Sns sns) throws IOException {
		sns.setMem_id(request.getParameter("mem_id"));
		sns = snsdao.OneMemberSelect(sns);

		return sns;
	}
	
	// 멤버별 포스트 모두 조회 하기
	@ResponseBody
	@RequestMapping(value = "/mysnslist")
	public Map<String, Object> MySnsList(Model model, HttpServletRequest request, Sns sns, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		sns.setMem_id(sns.getMem_id());
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}

		Paging paging = new Paging();

		paging.setPageUnit(5); // 한페이지에 5건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정

		sns.setSns_first(paging.getFirst());
		sns.setSns_last(paging.getLast());

		paging.setTotalRecord(snsdao.getsnsCount(sns));

		System.out.println(paging);

		map.put("paging", paging);
		
		
		
		map.put("snslist", snsdao.myPostList(sns));
		return map;
	}

}
