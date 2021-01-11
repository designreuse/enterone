package com.yedam.fandemic.sns;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
			model.addAttribute("countmysns", snsdao.countMySns(sns)); 			//내SNS 카운트
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
}
