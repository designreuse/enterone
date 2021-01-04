package com.yedam.fandemic.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.fandemic.service.GoodsServiceD;
import com.yedam.fandemic.vo.Goods;

@Controller
public class GoodsControllerD {
	
	@Autowired GoodsServiceD goodsServiceD;
	
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
}
