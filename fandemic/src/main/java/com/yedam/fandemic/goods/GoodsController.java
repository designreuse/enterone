package com.yedam.fandemic.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.GoodsMapper;
import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;

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
		model.addAttribute(goMapper.goodsDetail(goods));
		return new ModelAndView("goods/goods_detail");
	}
	

	// Goods 상세화면 - 장바구니 insert
	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	@ResponseBody
	public void cartInsert(HttpSession session, HttpServletRequest request, Cart cart) throws IOException {
		Member member = (Member)session.getAttribute("member");	// 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id());						// 불러온 member에서 mem_id만 cart에 담기
		String no = request.getParameter("go_no");
		cart.setGo_no(no);
		cart.setCart_qty(request.getParameter("cart_qty"));
		System.out.println("====================" + no + request.getParameter("cart_qty"));
		goMapper.cartInsert(cart);
	 }
 


	// Goods 상세화면 - 구매정보 insert


	// 장바구니 화면 - 목록
	@RequestMapping(value = "/cart")
	public ModelAndView cartList(HttpSession session, Model model, Cart cart) throws IOException {
		Member member = (Member)session.getAttribute("member");	// 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id());						// 불러온 member에서 mem_id만 cart에 담기
		// System.out.println(member.getMem_id());
		
		model.addAttribute("cart", goMapper.cartList(cart));
		return new ModelAndView("goods/goods_cart");
	}
	
	// 장바구니 화면 - 삭제
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	@ResponseBody
	public boolean cartDel(HttpSession session, HttpServletRequest request, Cart cart) throws IOException {
		Member member = (Member)session.getAttribute("member");	// 세션에 저장해둔 member 불러오기
		cart.setMem_id(member.getMem_id());						// 불러온 member에서 mem_id만 cart에 담기
		cart.setCart_no(request.getParameter("cart_no"));
		goMapper.cartDel(cart);
		return true;
	}

	/*
	 * https://badstorage.tistory.com/39
	 * 
	 * //카트리스트에서 주문하기
	 * 
	 * @PostMapping("/cartList") public String order(HttpSession session, OrderVO
	 * order, @RequestParam(value = "chk[]") List<String> chArr) throws Exception {
	 * logger.info("order");
	 * 
	 * String userId = (String)session.getAttribute("member");
	 * 
	 * //주문번호(orderId) 생성을 위한 로직 Calendar cal = Calendar.getInstance(); int year =
	 * cal.get(Calendar.YEAR); String ym = year + new
	 * DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); String ymd = ym +
	 * new DecimalFormat("00").format(cal.get(Calendar.DATE)); String subNum = "";
	 * 
	 * for(int i = 1; i <= 6; i ++) { subNum += (int)(Math.random() * 10); }
	 * 
	 * String orderId = ymd + "_" + subNum; //ex) 20200508_373063
	 * order.setOrderId(orderId); order.setUserId(userId);
	 * 
	 * service.orderInfo(order); //주문 테이블 insert
	 * 
	 * int cartNum = 0; for(String i : chArr){ cartNum = Integer.parseInt(i);
	 * System.out.println("cart -> CHK orderList : "+cartNum);
	 * System.out.println("cart -> orderId orderList : "+orderId);
	 * service.orderInfoDetails(orderId,cartNum); //주문 상세 테이블 insert
	 * service.cartDelete(cartNum); //체크되어 들어온 cart번호로 cart table delete }
	 * 
	 * 
	 * return "redirect:/shop/myPage"; }
	 * 
	 */
	
	// 결제 화면 (배송지 입력, 주소 api, 결제 api)
	@RequestMapping(value = "/goodsBuy")
	public ModelAndView goodsBuy(HttpServletResponse response) throws IOException {
		return new ModelAndView("goods/goods_buy");
	}

	// 결제 결과 화면 (select)
	@RequestMapping(value = "/goodsBuyDetail")
	public ModelAndView goodsBuyDetail(HttpServletResponse response) throws IOException {
		return new ModelAndView("goods/goods_buy_detail");
	}

}
