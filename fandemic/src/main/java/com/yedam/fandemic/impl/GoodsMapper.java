package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Goods;

public interface GoodsMapper {
	
	// Goods 전체 목록
	public List<Goods> goodsList(Goods goods);
	
	// Goods 전체 목록 - 카테고리별 필터링
	public List<Goods> goFilter(Goods goods);
	
	// Goods 상세 페이지
	public Goods goodsDetail(Goods goods);
	
	// Cart 담기
	public void cartInsert(Cart cart);
	
	// Cart 목록
	public List<Cart> cartList(Cart cart);
	
	// Cart 삭제
	public Cart cartDel(Cart cart);
	
	// paging
	public int goCount();	// Goods 목록
}
