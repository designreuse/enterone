package com.yedam.fandemic.goods;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {
	@RequestMapping(value="/goods")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("goods/goods");
	}
	
	@RequestMapping(value="/goodsDetail")
	public ModelAndView test1(HttpServletResponse response) throws IOException{
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
