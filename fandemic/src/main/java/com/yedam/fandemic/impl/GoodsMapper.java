package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Gbuydetail;
import com.yedam.fandemic.vo.Gbuyer;
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
	public int cartDel(Cart cart);
	
	// Cart 수량 변경
	public int cartUpdate(Cart cart);
	
	// 주문 페이지 목록 (장바구니값 불러오기)
	public List<Cart> orderList(Cart cart);
	
	// 주문 insert
	public void buyInsert(Gbuyer gbuyer);

	// 주문상세 insert
	public void buyDetailInsert(Gbuydetail gbuydetail);
	
	// Cart 비우기
	public void cartAllDelete(String mem_id);
	
	// 주문 결과 페이지 - 주문 목록
	public List<Gbuyer> buyList(Gbuyer gbuyer);
	
	// 주문 결과 상세 모달 (buyListDetail)
	public List<Gbuydetail> buyListDetail(Gbuydetail gbuydetail);
	
	
	
	// paging
	public int goCount();	// Goods 목록
}
