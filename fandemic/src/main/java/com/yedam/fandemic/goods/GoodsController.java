package com.yedam.fandemic.goods;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.GoodsMapper;
import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Gbuydetail;
import com.yedam.fandemic.vo.Gbuyer;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Tbuyer;

@Controller
public class GoodsController {

	@Autowired
	GoodsMapper goMapper;

	// Goods 메인 화면
	@RequestMapping(value = "/goods")
	public ModelAndView goodsMain(Model model, HttpServletRequest request, Goods goods) throws IOException {
		// 전체 조회
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		paging.setPageUnit(12); // 한페이지에 12건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		goods.setGo_first(paging.getFirst()); // paging에 현재 페이지만 넣으면 first, lastPage를 계산함
		goods.setGo_last(paging.getLast());
		paging.setTotalRecord(goMapper.goCount());

		model.addAttribute("paging", paging);
		model.addAttribute("goodsList", goMapper.goodsList(goods));

		return new ModelAndView("goods/goods");
	}

	// Goods 메인 화면 - 필터링
	@RequestMapping(value = "/goodsf")
	public ModelAndView goFilter(Model model, Goods goods, HttpServletRequest request) {

		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		paging.setPageUnit(12); // 한페이지에 12건씩. 생략시 기본10
		paging.setPageSize(5); // 페이지 번호 수 이전 123 다음 . 기본10
		paging.setPage(p); // 현재 페이지 지정
		goods.setGo_first(paging.getFirst()); // paging에 현재 페이지만 넣으면 first, lastPage를 계산함
		goods.setGo_last(paging.getLast());
		paging.setTotalRecord(goMapper.goCount());
		goods.setGo_type(request.getParameter("t"));

		model.addAttribute("paging", paging);
		model.addAttribute("go_type", request.getParameter("t"));
		model.addAttribute("goodsList", goMapper.goFilter(goods));

		return new ModelAndView("goods/goods");
	}

	// Goods 상세 화면
	@RequestMapping(value = "/goodsDetail/{no}")
	public ModelAndView goodsDetail(@PathVariable String no, Goods goods, Model model) throws IOException {
		// 단건
		goods.setGo_no(no);
		model.addAttribute("tbuyCount", goMapper.tbuyCount(goods));
		model.addAttribute(goMapper.goodsDetail(goods));
		return new ModelAndView("goods/goods_detail");
	}

	// Goods 상세화면 - 장바구니 insert
	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	@ResponseBody
	public void cartInsert(HttpSession session, HttpServletRequest request, Cart cart) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기
		String no = request.getParameter("go_no");
		cart.setGo_no(no);
		cart.setCart_qty(request.getParameter("cart_qty"));
		System.out.println("====================" + no + request.getParameter("cart_qty"));
		goMapper.cartInsert(cart);
	}
	
	
	
	
	
	

	// Goods 상세화면 (ticket) - 구매정보 insert
	
	// 주문
	@RequestMapping(value = "/ticketorder", method = RequestMethod.POST)
	@ResponseBody
	public Tbuyer tbuyInsert(HttpServletRequest request, HttpSession session, Tbuyer tbuyer) throws IOException {
//		logger.info("order");
		System.out.println("========================" + tbuyer);
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
//		String mem_id = member.getMem_id();
		
		//주문번호(orderId) 생성을 위한 로직
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String tbNo = "";
		
		for(int i = 1; i <= 6; i ++) {
			tbNo += (int)(Math.random() * 10);
		}
		 
		String tb_no = ymd + "_" + tbNo;
		
		tbuyer.setTb_no(tb_no); // 주문번호
//		tbuyer.setGo_no(request.getParameter(go_); // 상품번호
		tbuyer.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 tbuyer에 담기
		System.out.println("-----------------------------------------------------------------" + tbuyer);
		
		goMapper.tbuyInsert(tbuyer); // tbuyer에 예매정보 insert
//		goMapper.cartAllDelete(member.getMem_id()); // Goods 재고 -1
		
		return tbuyer;
	}
	
	
	
	
	

	// 장바구니 화면 - 목록
	@RequestMapping(value = "/cart")
	public ModelAndView cartList(HttpSession session, Model model, Cart cart) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		if (member == null) { // 로그인하지 않은 상태이면 로그인 화면으로 이동
			return new ModelAndView("/login");
		} else {
			cart.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기
			model.addAttribute("cart", goMapper.cartList(cart));
			return new ModelAndView("goods/goods_cart");
		}
	}

	// 장바구니 화면 - 삭제
	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean cartDel(HttpSession session, HttpServletRequest request, Cart cart) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기
		cart.setCart_no(request.getParameter("cart_no"));
		goMapper.cartDel(cart);
		return true;
	}

	// 장바구니 화면 - 수량 변경
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	@ResponseBody
	public boolean cartUpdate(HttpSession session, HttpServletRequest request, Cart cart) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기
		cart.setCart_qty(request.getParameter("cart_qty"));
		cart.setCart_no(request.getParameter("cart_no"));
		goMapper.cartUpdate(cart);
		return true;
	}

	// 결제 화면 (배송지 입력, 주소 api, 결제 api)
	@RequestMapping(value = "/goodsBuy")
	public ModelAndView orderList(HttpSession session, HttpServletRequest request, Model model, Cart cart)
			throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		if (member == null) { // 로그인하지 않은 상태이면 로그인 화면으로 이동
			return new ModelAndView("/login");
		} else {
			cart.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기
			model.addAttribute("order", goMapper.orderList(cart));
			return new ModelAndView("goods/goods_buy");
		}
	}

	// 주문
	@RequestMapping(value = "/goodsBuy/order", method = RequestMethod.POST)
	@ResponseBody
	public Gbuyer order(HttpSession session, Gbuyer gbuyer, Gbuydetail gbuydetail) throws IOException {
//		logger.info("order");
		System.out.println("========================" + gbuyer);
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
//		String mem_id = member.getMem_id();
		
		//주문번호(orderId) 생성을 위한 로직
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String gbNo = "";
		
		for(int i = 1; i <= 6; i ++) {
			gbNo += (int)(Math.random() * 10);
		}
		 
		String gb_no = ymd + "_" + gbNo;
		
		gbuyer.setGb_no(gb_no); // 주문번호
		gbuyer.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 gbuyer에 담기
		System.out.println("-----------------------------------------------------------------" + gbuyer);
	
		gbuydetail.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 gbuydetail에 담기
		gbuydetail.setGb_no(gb_no);
		System.out.println("-----------------------------------------------------------------" + gbuydetail);
		
		goMapper.buyInsert(gbuyer);
		goMapper.buyDetailInsert(gbuydetail);
		goMapper.cartAllDelete(member.getMem_id()); // Cart 비우기
		
		return gbuyer;
	}

	// 주문 결과 페이지 - 주문 목록
	@RequestMapping(value = "/buyList")
	public ModelAndView buyList(HttpSession session, Gbuyer gbuyer, Model model) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		if (member == null) { // 로그인하지 않은 상태이면 로그인 화면으로 이동
			return new ModelAndView("/login");
		} else {
			gbuyer.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 gbuyer에 담기
			
			model.addAttribute("buyList", goMapper.buyList(gbuyer));
			return new ModelAndView("goods/goods_buy_detail");
		}
	}
	
	
	
	
	// 주문 결과 페이지 - 예매 목록 (reservList)
	@RequestMapping(value = "/reservList")
	public ModelAndView reservList(HttpSession session, Tbuyer tbuyer, Model model) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		if (member == null) { // 로그인하지 않은 상태이면 로그인 화면으로 이동
			return new ModelAndView("/login");
		} else {
			tbuyer.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 gbuyer에 담기
			
			model.addAttribute("reservList", goMapper.reservList(tbuyer));
			return new ModelAndView("goods/goods_buy_detail");
		}
	}
	
	
	// 주문 결과 상세 모달
	@RequestMapping(value = "/buyList/detail", method = RequestMethod.POST)
	@ResponseBody
	public List<Gbuydetail> buyListDetail(Model model,HttpSession session, HttpServletRequest request, Gbuydetail gbuydetail) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		gbuydetail.setMem_id(member.getMem_id()); // 불러온 member에서 mem_id만 cart에 담기

		gbuydetail.setGb_no(request.getParameter("gb_no"));
		//model.addAttribute("gbuydetail", );
//		
		return goMapper.buyListDetail(gbuydetail);
	}

	
//	to-do-list	
//	장바구니에 중복 상품 담을 수 없게
//	장바구니 0건이면 주문 화면으로 넘어갈 수 없게

}
