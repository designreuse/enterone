package com.yedam.fandemic.goods;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.service.GoodsServiceD;
import com.yedam.fandemic.vo.Cnotice;
import com.yedam.fandemic.vo.Goods;

@Controller
public class GoodsControllerD {
	
	@Autowired GoodsServiceD goodsServiceD;
	//굿즈 리스트 목록조회 , ajax
	@RequestMapping(value="/management/goods/goodsListAll")
	@ResponseBody //결과값 JSON형태로
	public List<Goods> GoodsLists(Goods goods) {
		System.out.println("================"+goods.getCom_id());
		return goodsServiceD.getGoodsList(goods);
	}
	//굿즈 리스트 목록 페이지
	@RequestMapping(value = "/management/goods/goodsList")
	public String GoodsList(Goods goods) {
		return "mgt/goods/goodsList";
	}
	
	//굿즈 등록 페이지
	@RequestMapping("/management/goods/goodsInsertForm")
	public String GoodsInsertForm(Model model, Goods goods) {
		model.addAttribute("star",goodsServiceD.getCompanyStar(goods));//com_id(소속사ID값), 소속사 연예인 조회
		model.addAttribute("category",goodsServiceD.getCategory()); //카테고리 값 다받아와서 뷰페이지로 ~휭~
		return "mgt/goods/goodsInsertForm";
	}
	
	//굿즈,행사 등록
	@RequestMapping(value = "/management/goods/InsertGoods")
	public String InsertGoods(HttpServletRequest request, Goods goods) throws IllegalStateException, IOException {
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile="";
	   // 굿즈,행사 상세사진 첨부파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("uploadDetailImg");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/goods");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         goods.setGo_detail(sumFile);
		      }else {
		    	  goods.setGo_detail("");
		      }
	      }
	      MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
	      //굿즈,행사 대표사진 첨부파일
	      MultipartFile multipartFile1 = multipartRequest1.getFile("uploadFile");
		      if (!multipartFile1.isEmpty() && multipartFile1.getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/goods");
		    	  System.out.println("path="+path);
		         multipartFile1.transferTo(new File(path, multipartFile1.getOriginalFilename()));
		         goods.setGo_pic(multipartFile1.getOriginalFilename());
		      }else {
		    	  goods.setGo_pic("");
		      }
			goodsServiceD.insertGoods(goods);
		return "mgt/goods/goodsList";
	}
	//굿즈,행사 목록 삭제
	@RequestMapping(value = "/management/goods/goodsDelete")
	@ResponseBody //결과를 Json형태로 변환
	public int goodsDelete(Goods goods) {
		int result = goodsServiceD.deleteGoods(goods);
		return result;
	}
	// 굿즈,행사 목록 상세보기
	@RequestMapping(value = "/management/goods/goodsDetail")
	public String noticesDetail(Model model, Goods goods) {
		System.out.println(goods.getGo_no()); //클릭한게시물번호받아와서
		model.addAttribute("goods", goodsServiceD.getGoodsDetail(goods));//조회한후 값던짐
		return "no-tiles/goods/goodsDetail";
	}
	
	
	
}
