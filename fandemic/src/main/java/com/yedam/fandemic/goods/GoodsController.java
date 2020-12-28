package com.yedam.fandemic.goods;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.GoodsMapper;
import com.yedam.fandemic.vo.Goods;

@Controller
public class GoodsController {
	
	@Autowired GoodsMapper goMapper;
	
	
	// Goods 메인 화면
	@RequestMapping(value="/goods")
	public ModelAndView test(Model model, Goods goods) throws IOException{
		// 전체 조회 (리스트, foreach 사용)
		model.addAttribute("goodsList", goMapper.goodsList(goods));
		return new ModelAndView("goods/goods");
	}
	
	// Goods 상세 화면
	@RequestMapping(value="/goodsDetail")
	public ModelAndView test1(HttpServletResponse response) throws IOException{
		/* 단건 */ 
		
		return new ModelAndView("goods/goods_detail");
	}
	
	@RequestMapping(value="/goodsBuy")
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_buy");
	}
	
	@RequestMapping(value="/goodsBuyDetail")
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_buy_detail");
	}
	
	@RequestMapping(value="/goodsCart")
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_cart");
	}
}
