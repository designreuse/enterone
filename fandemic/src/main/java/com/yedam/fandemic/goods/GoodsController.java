package com.yedam.fandemic.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.GoodsMapper;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Paging;

@Controller
public class GoodsController {
	
	@Autowired GoodsMapper goMapper;	
	
	// Goods 메인 화면
	@RequestMapping(value="/goods")
	public ModelAndView goodsMain(Model model, HttpServletRequest request, Goods goods) throws IOException{
		// 전체 조회 (리스트, foreach 사용)
		
		String strp = request.getParameter("p");
		int p = 1;
		
		if(strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		
		paging.setPageUnit(12); // 한페이지에 12건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		
		goods.setGo_first(paging.getFirst()); //paging에 현재 페이지만 넣으면 first, lastPage를 계산함
		goods.setGo_last(paging.getLast());
		
		paging.setTotalRecord(goMapper.goCount());

		model.addAttribute("paging", paging);
		model.addAttribute("goodsList", goMapper.goodsList(goods));
		
		return new ModelAndView("goods/goods");
	}
	
	// Goods 메인 화면 - 필터링
	@RequestMapping(value = "/goodsf")
	public ModelAndView goFilter(Model model, Goods goods, HttpServletRequest request) {
		
		goods.setGo_type(request.getParameter("t"));
		model.addAttribute("goodsList", goMapper.goFilter(goods));
		
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
