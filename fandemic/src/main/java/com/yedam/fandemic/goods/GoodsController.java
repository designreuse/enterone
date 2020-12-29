package com.yedam.fandemic.goods;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.GoodsMapper;
import com.yedam.fandemic.vo.Goods;

@Controller
public class GoodsController {
	
	@Autowired GoodsMapper goMapper;	
	
	// Goods 메인 화면
	@RequestMapping(value="/goods")
	public ModelAndView goodsMain(Model model, Goods goods) throws IOException{
		// 전체 조회 (리스트, foreach 사용)
		model.addAttribute("goodsList", goMapper.goodsList(goods));
		return new ModelAndView("goods/goods");
	}
	
	// Goods 상세 화면
	@RequestMapping(value="/goodsDetail/{no}")
	public ModelAndView goodsDetail(@PathVariable String no, Goods goods, Model model) throws IOException{
		// 단건
		goods.setGo_no(no);
		model.addAttribute(goMapper.goodsDetail(goods));
		return new ModelAndView("goods/goods_detail");
	}
	
	@RequestMapping(value="/goodsBuy")
	public ModelAndView goodsBuy(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_buy");
	}
	
	@RequestMapping(value="/goodsBuyDetail")
	public ModelAndView goodsBuyDetail(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_buy_detail");
	}
	
	@RequestMapping(value="/goodsCart")
	public ModelAndView goodsCart(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods_cart");
	}
}
